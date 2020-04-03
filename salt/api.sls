{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master

salt-api:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_api }}
  {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
  {%- endif %}
{% endif %}
{% if salt_settings.api_service_details.state != 'ignore' %}
  service.{{ salt_settings.api_service_details.state }}:
    - enable: {{ salt_settings.api_service_details.enabled }}
    - name: {{ salt_settings.api_service }}
    - require:
      - service: {{ salt_settings.master_service }}
    - watch:
{% if salt_settings.install_packages %}
      - pkg: salt-api
{% endif %}
      - file: salt-master
{% endif %}
