{% from "salt/package-map.jinja" import pkgs with context %}

include:
  - salt.master

salt-syndic:
  pkg.installed:
    - name: {{ pkgs['salt-syndic'] }}
  service:
    - running
    - require:
      - service: salt-master
    - watch:
      - pkg: salt-master
      - file: /etc/salt/master