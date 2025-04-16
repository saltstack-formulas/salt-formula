# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_windows_excluded = tplroot ~ ".windows-excluded" %}
{%- set sls_config_files = tplroot ~ '.master.config.files' %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}

{%- if salt_settings.master_service_details.state != 'ignore' %}
include:
  - {{ sls_windows_excluded }}
  - {{ sls_config_files }}

{%-   set wanted_state = salt_settings.master_service_details.state %}
{%-   set retry = {
        'FreeBSD': salt_settings.retry_options | json,
        'Gentoo': salt_settings.retry_options | json,
      }.get(grains.os_family, '')
      %}

salt-master-service-{{ wanted_state }}:
  service.{{ wanted_state }}:
    - enable: {{ salt_settings.master_service_details.enabled }}
    - name: {{ salt_settings.master_service }}
    - retry: {{ retry }}
    - watch:
      - sls: {{ sls_config_files }}
{%- endif %}
