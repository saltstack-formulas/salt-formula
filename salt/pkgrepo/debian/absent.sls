{% from "salt/map.jinja" import salt_settings with context %}

drop-saltstack-pkgrepo:
  pkgrepo.absent:
    - name: {{ salt_settings.pkgrepo }}
  file.absent:
    - name: /etc/apt/sources.list.d/saltstack.list

drop-saltstack-apt-key:
  file.absent:
    - name: /etc/apt/trusted.gpg.d/saltstack.gpg
