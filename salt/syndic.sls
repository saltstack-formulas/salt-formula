{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master

salt-syndic:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_syndic }}
  {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
  {%- endif %}
  {%- if salt_settings.hold_version is defined %}
    - hold: {{ salt_settings.hold_version }}
  {%- endif %}
  {%- if salt_settings.update_holds is defined %}
    - update_holds: {{ salt_settings.update_holds }}
  {%- endif %}
    - require_in:
      - service: salt-syndic
    - watch_in:
      - service: salt-syndic
{% endif %}
  service.running:
    - enable: True
    - name: {{ salt_settings.syndic_service }}
    {%- if grains.os_family == 'FreeBSD' %}
    - retry: {{ salt_settings.retry_options | json }}
    {%- endif %}
    - require:
      - service: salt-master
    - watch:
{% if salt_settings.install_packages %}
      - pkg: salt-master
{% endif %}
      - file: salt-master
