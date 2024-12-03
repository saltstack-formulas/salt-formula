# -*- coding: utf-8 -*-
# vim: ft=sls
{%- from "salt/map.jinja" import salt_settings with context %}

{%- if grains['os']|lower not in ['fedora'] %}
salt-pkgrepo-install-saltstack-redhat:
  pkgrepo.managed:
    - name: {{ salt_settings.pkgrepo_name }}
    - humanname: {{ salt_settings.pkgrepo_humanname }}
    - baseurl: {{ salt_settings.pkgrepo }}
    - priority: 10
    - enabled: 1
    - enabled_metadata: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
    {%- if grains['os']|lower in ['amazon'] %}
    - failovermethod: priority
    {%- endif %}
{%- endif %}
