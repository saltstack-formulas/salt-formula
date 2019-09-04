# -*- coding: utf-8 -*-
# vim: ft=sls
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}

salt-pkgrepo-clean-saltstack-debian:
  pkgrepo.absent:
    - name: {{ salt_settings.pkgrepo }}
  file.absent:
    - name: /etc/apt/sources.list.d/saltstack.list

salt-pkgrepo-clean-saltstack-debian-apt-key:
  file.absent:
    - name: /etc/apt/trusted.gpg.d/saltstack.gpg
