{% from "salt/map.jinja" import salt_settings with context %}

{%- if grains['os']|lower not in ('amazon', 'fedora') %}
saltstack-pkgrepo:
  pkgrepo.managed:
    - humanname: SaltStack repo for RHEL/CentOS $releasever
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
{% endif %}
