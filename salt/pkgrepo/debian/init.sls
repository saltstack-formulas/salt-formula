{% from "salt/map.jinja" import salt_settings with context %}

saltstack-pkgrepo:
  pkgrepo.managed:
    - humanname: SaltStack Debian Repo
    - name: {{ salt_settings.pkgrepo }}
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: {{ salt_settings.key_url }}
    # Order: 1 because we can't put a require_in on "pkg: salt-{master,minion}"
    # because we don't know if they are used.
    - order: 1
