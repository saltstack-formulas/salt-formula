# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "salt/map.jinja" import salt_settings with context %}

salt-pkgrepo-install-saltstack-suse:
  pkgrepo.managed:
    - name: systemsmanagement_saltstack_products
    - humanname: SaltStack repo for Opensuse 15.x
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
