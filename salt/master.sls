{% from "salt/package-map.jinja" import pkgs with context %}

salt-master:
  pkg.installed:
    - name: {{ pkgs['salt-master'] }}
  file.managed:
    - name: {{ pkgs.get('config-path', '/etc/salt') }}/master.d/master.conf
    - template: jinja
    - source: salt://salt/files/master
  service.running:
    - enable: True
    - name: {{ pkgs.get('master-service', 'salt-master') }}
    - watch:
      - pkg: salt-master
      - file: salt-master
