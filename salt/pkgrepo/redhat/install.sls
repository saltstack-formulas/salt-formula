# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "salt/map.jinja" import salt_settings with context %}

  {%- if grains['os']|lower not in ('amazon', 'fedora') %}
salt-pkgrepo-install-saltstack-redhat:
  pkgrepo.managed:
    - name: saltstack
    - humanname: SaltStack repo for RHEL/CentOS $releasever
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
  {% endif %}
