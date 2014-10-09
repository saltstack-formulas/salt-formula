{% from "salt/package-map.jinja" import pkgs with context %}

salt-master:
  pkg.installed:
    - name: {{ pkgs['salt-master'] }}
  file.recurse:
    - name: {{ pkgs.get('config-path', '/etc/salt') }}/master.d
    - template: jinja
    - source: salt://salt/files/master.d
    - clean: True
  service.running:
    - enable: True
    - name: {{ pkgs.get('master-service', 'salt-master') }}
    - watch:
      - pkg: salt-master
      - file: salt-master
