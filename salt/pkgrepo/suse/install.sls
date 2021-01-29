# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "salt/map.jinja" import salt_settings with context %}

{#- Resorting to this ugly hack since the state doesn't handle if the `baseurl` is
    already configured under another name, such as used by the `salt-bootstrap` #}
{%- if not salt["cmd.run"]("zypper lr --uri | grep " ~ salt_settings.pkgrepo) %}
salt-pkgrepo-install-saltstack-suse:
  pkgrepo.managed:
    - name: systemsmanagement_saltstack_products
    - humanname: {{ salt_settings.pkgrepo_humanname }}
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
    - gpgautoimport: true
{%- endif %}
