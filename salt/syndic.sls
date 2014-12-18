{% from "salt/package-map.jinja" import pkgs with context %}

include:
  - salt.master

salt-syndic:
{% if not salt['pillar.get']('salt:no_install_packages', False) %}
  pkg.installed:
    - name: {{ pkgs['salt-syndic'] }}
{% endif %}
  service:
    - running
    - require:
      - service: salt-master
    - watch:
      - pkg: salt-master
      - file: /etc/salt/master