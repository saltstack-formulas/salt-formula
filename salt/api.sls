{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master

salt-api:
{% if salt_settings.install_packages %}
  pkg.installed:
    - pkgs:
      - {{ salt_settings.salt_api }}
{% if salt['pillar.get']('salt:master:rest_tornado', {}) %}
      - {{ salt_settings.python_tornado }}
{% endif %}
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
