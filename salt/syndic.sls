{% from "salt/map.jinja" import salt_settings, sls_block with context %}

include:
  - salt.master

salt-syndic:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_syndic }}
    {{ sls_block(salt_settings.package.opts) }}
{% endif %}
  service.running:
    - name: {{ salt_settings.syndic_service }}
    - require:
      - service: salt-master
    - watch:
{% if salt_settings.install_packages %}
      - pkg: salt-master
{% endif %}
      - file: salt-master
