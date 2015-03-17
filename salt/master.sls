{% from "salt/map.jinja" import salt with context %}

salt-master:
{% if salt['pillar.get']('salt:install_pkgs', True) %}
  pkg.installed:
    - name: {{ salt['salt-master'] }}
{% endif %}
  file.recurse:
    - name: {{ salt.get('config-path', '/etc/salt') }}/master.d
    - template: jinja
    - source: salt://salt/files/master.d
    - clean: True
  service.running:
    - enable: True
    - name: {{ salt.get('master-service', 'salt-master') }}
    - watch:
      - pkg: salt-master
      - file: salt-master
