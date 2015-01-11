{% from "salt/map.jinja" import salt with context %}

include:
  - salt.master

salt-syndic:
  pkg.installed:
    - name: {{ salt['salt-syndic'] }}
  service:
    - running
    - require:
      - service: {{ salt.get('syndic-service', 'salt-master') }}
    - watch:
      - pkg: salt-master
      - file: {{ salt.get('config-path', '/etc/salt') }}/master
