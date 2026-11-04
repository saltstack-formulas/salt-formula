# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "salt/map.jinja" import salt_settings with context %}

{% set salt_3008_or_newer = grains["saltversioninfo"] >= [3008] -%}

salt-pkgrepo-install-saltstack-debian-keyring:
  file.managed:
    - name: /etc/apt/keyrings/salt-archive-keyring.gpg
    - source: salt://salt/pkgrepo/debian/files/salt-archive-keyring.gpg
    - require_in:
      - pkgrepo: salt-pkgrepo-install-saltstack-debian

salt-pkgrepo-install-saltstack-debian-remove-old-files:
  file.absent:
    - names:
{%- if salt_3008_or_newer %}
      - /etc/apt/sources.list.d/salt.list
{%- else %}
      - /etc/apt/sources.list.d/salt.sources
{%- endif %}
      - /etc/apt/sources.list.d/saltstack.list
      - /etc/apt/keyrings/salt-archive-keyring.pgp
    - require_in:
      - pkgrepo: salt-pkgrepo-install-saltstack-debian

{% set source_ext = "sources" if salt_3008_or_newer else "list" -%}

salt-pkgrepo-install-saltstack-debian:
  pkgrepo.managed:
    - humanname: Salt Project
    - name: {{ salt_settings.pkgrepo }}
    - file: /etc/apt/sources.list.d/salt.{{ source_ext }}
    {% if salt_settings.get('key_url') is not none %}
    - key_url: {{ salt_settings.key_url }}
    {% endif %}
    - clean_file: True
    # Order: 3 because we can't put a require_in on "pkg: salt-{master,minion}"
    # because we don't know if they are used.
    - order: 3
