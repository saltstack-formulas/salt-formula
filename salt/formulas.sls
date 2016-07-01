{% set processed_gitdir_envs = [] %}
{% set processed_basedirs = [] %}

{% from "salt/formulas.jinja" import formulas_git_opt with context %}
{% from "salt/formulas.jinja" import formulas_opts_for_git_latest with context %}

# Loop over all formulas listed in pillar data
{% for env, entries in salt['pillar.get']('salt_formulas:list', {}).items() %}
{% for entry in entries %}

{% set basedir = formulas_git_opt(env, 'basedir')|load_yaml %}
{% set gitdir = '{0}/{1}'.format(basedir, entry) %}
{% set update = formulas_git_opt(env, 'update')|load_yaml %}

# Setup the directory hosting the Git repository
{% if basedir not in processed_basedirs %}
{% do processed_basedirs.append(basedir) %}
{{ basedir }}:
  file.directory:
    {%- for key, value in salt['pillar.get']('salt_formulas:basedir_opts',
                                             {'makedirs': True}).items() %}
    - {{ key }}: {{ value }}
    {%- endfor %}
{% endif %}

# Setup the formula Git repository
{% set gitdir_env = '{0}_{1}'.format(gitdir, env) %}
{% if gitdir_env not in processed_gitdir_envs %}
{% do processed_gitdir_envs.append(gitdir_env) %}
{% set options = formulas_opts_for_git_latest(env)|load_yaml %}
{% set baseurl = formulas_git_opt(env, 'baseurl')|load_yaml %}
{{ gitdir_env }}:
  git.latest:
    - name: {{ baseurl }}/{{ entry }}.git
    - target: {{ gitdir }}
    {%- for key, value in options.items() %}
    - {{ key }}: {{ value }}
    {%- endfor %}
    - require:
      - file: {{ basedir }}
    {%- if not update %}
    - unless: test -e {{ gitdir }}
    {%- endif %}
{% endif %}

{% endfor %}
{% endfor %}
