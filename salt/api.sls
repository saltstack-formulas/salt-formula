{% from "salt/map.jinja" import salt_settings, sls_block with context %}

include:
  - salt.master

salt-api:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_api }}
    {{ sls_block(salt_settings.package.opts) }}
{% endif %}
  service.running:
    - enable: True
    - name: {{ salt_settings.api_service }}
    - require:
      - service: {{ salt_settings.master_service }}
    - watch:
{% if salt_settings.install_packages %}
      - pkg: salt-api
{% endif %}
      - file: salt-master
