{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.gitfs.gitpython.install_from_source %}

GitPython:
  pip.installed

{% else %}

python-git:
  pkg.installed

{% endif %}
