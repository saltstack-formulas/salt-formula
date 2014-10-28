{% from "salt/package-map.jinja" import pkgs with context %}

ensure salt-ssh is installed:
  pkg.installed:
    - name: {{ pkgs['salt-ssh'] }}

ensure roster config:
  file.managed:
    - name: {{ pkgs.get('config_path', '/etc/salt') }}/roster
    - source: salt://salt/files/roster.jinja
    - template: jinja
    - require:
      - pkg: ensure salt-ssh is installed
