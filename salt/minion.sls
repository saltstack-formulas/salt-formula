{% from "salt/package-map.jinja" import pkgs with context %}

salt-minion:
  pkg.installed:
    - name: {{ pkgs['salt-minion'] }}
  file.managed:
    - name: {{ pkgs.get('config-path', '/etc/salt') }}/minion.d/minion.conf
    - template: jinja
    - source: salt://salt/files/minion
  service.running:
    - enable: True
    - name: {{ pkgs.get('minion-service', 'salt-minion') }}
    - watch:
      - pkg: salt-minion
      - file: salt-minion
