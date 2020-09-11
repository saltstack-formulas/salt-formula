# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - salt.pkgrepo
      {%- if salt.config.get('salt_formulas:list') %}
  - salt.formulas
      {%- endif %}
      {%- if salt.config.get('salt:master')|length > 1 and grains.kernel != 'Windows' %}
  - salt.master
      {%- endif %}
      {%- if salt.config.get('salt:cloud')|length > 1 %}
  - salt.cloud
      {%- endif %}
      {%- if salt.config.get('salt:ssh_roster') %}
  - salt.ssh
      {%- endif %}
      {%- if salt.config.get('salt:minion')|length > 1 %}
          {%- if salt.config.get('salt:minion:master_type') %}
  - salt.minion
          {%- else %}
  - salt.standalone
          {%- endif %}
      {%- endif %}
      {%- if salt.config.get('salt:api') %}
  - salt.api
      {%- endif %}
      {%- if salt.config.get('salt:syndic') %}
  - salt.syndic
      {%- endif %}
