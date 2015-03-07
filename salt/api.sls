{% from "salt/map.jinja" import salt with context %}

include:
  - salt.master

salt-api:
  pkg.installed:
    - name: {{ salt['salt-api'] }}
  service.running:
    - name: {{ salt.get('api-service', 'salt-api') }}
    - require:
      - service: {{ salt.get('api-service', 'salt-master') }}
    - watch:
      - pkg: salt-master
