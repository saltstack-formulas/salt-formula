{% from "salt/map.jinja" import salt_settings with context %}

{% if 'gitfs' in salt_settings and 'gitpython' in salt_settings.gitfs %}

{% if salt_settings.gitfs.gitpython.install_from_source %}

GitPython:
  pip.installed

{% else %}

python-git:
  pkg.installed:
    - name: {{ salt_settings.python_git }}

{% endif %}

{% endif %}
