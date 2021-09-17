# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "salt/map.jinja" import salt_settings with context %}

salt-pkgrepo-clean-saltstack-debian:
  pkgrepo.absent:
    - name: {{ salt_settings.pkgrepo }}
  file.absent:
    - name: /etc/apt/sources.list.d/salt.list

salt-pkgrepo-clean-saltstack-debian-apt-key:
  file.absent:
    - name: /usr/share/keyrings/salt-archive-keyring.gpg
