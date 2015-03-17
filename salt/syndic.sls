{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master

salt-syndic:
  pkg.installed:
    - name: {{ salt_settings.salt_syndic }}
  service:
    - running
    - require:
      - service: {{ salt_settings.syndic_service }}
    - watch:
      - pkg: salt-master
      - file: {{ salt_settings.config_path }}/master
