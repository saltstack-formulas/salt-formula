{% from "salt/map.jinja" import salt_settings with context %}

saltstack-pkgrepo:
  pkgrepo.managed:
    - name: systemsmanagement_saltstack_products
    - humanname: SaltStack repo for Opensuse 42.3
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
