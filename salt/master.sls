{% from "salt/package-map.jinja" import pkgs with context %}

salt-master:
  pkg.installed:
    - name: {{ pkgs['salt-master'] }}
  file.recurse:
    - name: /etc/salt/master.d
    - template: jinja
    - source: salt://salt/files/master.d
    - clean: True
  service.running:
    - enable: True
    - watch:
      - pkg: salt-master
      - file: salt-master
