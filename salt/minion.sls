{% from "salt/package-map.jinja" import pkgs with context %}

salt-minion:
  pkg.installed:
    - name: {{ pkgs['salt-minion'] }}
  file.managed:
    - name: /etc/salt/minion
    - template: jinja
    - source: salt://salt/files/minion
  service.running:
    - enable: True
    - watch:
      - pkg: salt-minion
      - file: salt-minion
