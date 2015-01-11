{% from "salt/map.jinja" import salt with context %}

ensure salt-ssh is installed:
  pkg.installed:
    - name: {{ salt['salt-ssh'] }}

ensure roster config:
  file.managed:
    - name: {{ salt.get('config_path', '/etc/salt') }}/roster
    - source: salt://salt/files/roster.jinja
    - template: jinja
    - require:
      - pkg: ensure salt-ssh is installed
