# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_windows_excluded = tplroot ~ ".windows-excluded" %}

include:
  - {{ sls_windows_excluded }}
  - .package
  - .config
  - .service
