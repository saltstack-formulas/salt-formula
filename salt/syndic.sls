{% from "salt/map.jinja" import salt with context %}

include:
  - salt.master

salt-syndic:
{% if salt['pillar.get']('salt:install_pkgs', True) %}
  pkg.installed:
    - name: {{ salt['salt-syndic'] }}
{% endif %}
  service:
    - running
    - require:
      - service: {{ salt.get('syndic-service', 'salt-master') }}
    - watch:
      - pkg: salt-master
      - file: {{ salt.get('config-path', '/etc/salt') }}/master
