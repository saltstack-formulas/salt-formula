{% set processed_gitdirs = [] %}
{% set processed_basedirs = [] %}

{% from "salt/formulas.jinja" import formulas_git_opt with context %}

# Loop over all formulas listed in pillar data
{% for env, entries in salt['pillar.get']('salt_formulas:list', {}).iteritems() %}
{% for entry in entries %}

{% set basedir = formulas_git_opt(env, 'basedir') %}
{% set gitdir = '{0}/{1}'.format(basedir, entry) %}
{% set update = formulas_git_opt(env, 'update')|load_yaml %}

# Setup the directory hosting the Git repository
{% if basedir not in processed_basedirs %}
{% do processed_basedirs.append(basedir) %}
{{ basedir }}:
  file.directory:
    {%- for key, value in salt['pillar.get']('salt_formulas:basedir_opts',
                                             {'makedirs': True}).iteritems() %}
    - {{ key }}: {{ value }}
    {%- endfor %}
{% endif %}

# Setup the formula Git repository
{% if gitdir not in processed_gitdirs %}
{% do processed_gitdirs.append(gitdir) %}
{% set options = formulas_git_opt(env, 'options')|load_yaml %}
{{ gitdir }}:
  git.latest:
    - name: {{ formulas_git_opt(env, 'baseurl') }}/{{ entry }}.git
    - target: {{ gitdir }}
    {%- for key, value in options.iteritems() %}
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
