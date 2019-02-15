{%- set processed_gitdirs = {} %}
{%- set processed_gitdir_envs = [] %}
{%- set processed_basedirs = [] %}

{%- from "salt/map.jinja" import formulas_settings with context %}
{%- from "salt/formulas.jinja" import formulas_git_opt with context %}
{%- from "salt/formulas.jinja" import formulas_opts_for_git_latest with context %}

# Loop over all formulas listed in pillar data
{%- for env, entries in salt['pillar.get']('salt_formulas:list', {}).items() %}
{%-   for entry in entries %}

{%-     set basedir = formulas_git_opt(env, 'basedir')|load_yaml %}
{%-     set gitdir = '{0}/{1}'.format(basedir, entry) %}
{%-     set update = formulas_git_opt(env, 'update')|load_yaml %}

{%-     if formulas_settings.checkout_orig_branch %}
{%-       if not salt['file.directory_exists']('{0}/{1}'.format(gitdir, '.git')) %}
{%-         set gitdir_branch = '' %}
{%-       else %}
{%-         set gitdir_branch = salt['git.current_branch'](gitdir) %}
{%-       endif %}
{%-       do processed_gitdirs.update({gitdir:gitdir_branch}) %}
{%-     endif %}

# Setup the directory hosting the Git repository
{%-     if basedir not in processed_basedirs %}
{%-       do processed_basedirs.append(basedir) %}
{{ basedir }}:
  file.directory:
    {%-   for key, value in salt['pillar.get']('salt_formulas:basedir_opts',
                                               {'makedirs': True}).items() %}
    - {{ key }}: {{ value }}
    {%-   endfor %}
{%-     endif %}

# Setup the formula Git repository
{%-     set gitdir_env = '{0}_{1}'.format(gitdir, env) %}
{%-     if gitdir_env not in processed_gitdir_envs %}
{%-       do processed_gitdir_envs.append(gitdir_env) %}
{%-       set options = formulas_opts_for_git_latest(env)|load_yaml %}
{%-       set baseurl = formulas_git_opt(env, 'baseurl')|load_yaml %}

{{ gitdir_env }}:
  git.latest:
    - name: {{ baseurl }}/{{ entry }}.git
    - target: {{ gitdir }}
    {%-   for key, value in options.items() %}
    - {{ key }}: {{ value }}
    {%-   endfor %}
    - require:
      - file: {{ basedir }}
    {%-   if not update %}
    - onlyif: rm -fr {{ gitdir }} >/dev/null 2>&1 | true
    {%-   endif %}
{%-     endif %}
{%-   endfor %}
{%- endfor %}

{%- if formulas_settings.checkout_orig_branch %}
# For each directory processed, explicitly checkout the original branch before
# the `git.latest` state ran
{%-   for gitdir, original_branch in processed_gitdirs.items() %}
{%-     if original_branch %}
{%-       set gitdir_user = salt['file.get_user'](gitdir) %}
checkout_original_branch_for_{{ gitdir }}:
  module.run:
    - name: git.checkout
    - order: last
    - cwd: {{ gitdir }}
    - rev: {{ original_branch }}
    - user: {{ gitdir_user }}
    - unless: test "$(cd {{ gitdir }}; git rev-parse --abbrev-ref HEAD)" = "{{ original_branch }}"
{%-     endif %}
{%-   endfor %}
{%- endif %}
