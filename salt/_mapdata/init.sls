# -*- coding: utf-8 -*-
# vim: ft=sls
---
{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}
{%- from tplroot ~ "/map.jinja" import formulas_settings with context %}

{%- set _mapdata = {
      "values": {
        "salt_settings": salt_settings,
        "formulas_settings": formulas_settings,
      }
    } %}
{%- do salt["log.debug"]("### MAP.JINJA DUMP ###\n" ~ _mapdata | yaml(False)) %}

{%- set output_dir = "/temp" if grains.os_family == "Windows" else "/tmp" %}
{%- set output_file = output_dir ~ "/salt_mapdata_dump.yaml" %}

{{ tplroot }}-mapdata-dump:
  file.managed:
    - name: {{ output_file }}
    - source: salt://{{ tplroot }}/_mapdata/_mapdata.jinja
    - template: jinja
    - context:
        map: {{ _mapdata | yaml }}
