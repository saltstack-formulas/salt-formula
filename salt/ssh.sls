{% from "salt/map.jinja" import salt_settings with context %}

ensure salt-ssh is installed:
  pkg.installed:
    - name: {{ salt_settings.salt_ssh }}

ensure roster config:
  file.managed:
    - name: {{ salt_settings.config_path }}/roster
    - source: salt://salt/files/roster.jinja
    - template: jinja
    - require:
      - pkg: ensure salt-ssh is installed
