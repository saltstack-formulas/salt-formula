{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master

salt-api:
  pkg.installed:
    - name: {{ salt_settings.salt_api }}
  service.running:
    - name: {{ salt_settings.api_service }}
    - require:
      - service: {{ salt_settings.api_service }}
    - watch:
      - pkg: salt-master
