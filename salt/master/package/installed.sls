# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_windows_excluded = tplroot ~ '.windows-excluded' %}
{%- set sls_pin_version = tplroot ~ '.pin' %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}

{#- `salt-master` cannot be installed on Windows machines #}
{%- set sls_dependencies = [sls_windows_excluded] %}

{%- if salt_settings.pin_version and salt_settings.version and grains.os_family|lower == 'debian' %}
{%-   do sls_dependencies.append(sls_pin_version) %}
{%- endif %}

include: {{ sls_dependencies }}

{%- if salt_settings.install_packages %}
salt-master-package-installed-pkg.installed:
  pkg.installed:
    - name: {{ salt_settings.salt_master }}
    - version: {{ salt_settings.version | default('~') }}
    - require:
      - sls: {{ sls_windows_excluded }}
{%- endif %}
