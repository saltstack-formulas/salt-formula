# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split("/")[0] %}
{%- set sls_windows_excluded = tplroot ~ ".windows-excluded" %}
{%- set sls_package_install = tplroot ~ ".master.package.installed" %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}

include:
  - {{ sls_windows_excluded }}
  - {{ sls_package_install }}

{%- if salt_settings.master_config_use_TOFS %}
{%-   set source = files_switch(["master.d"],
                                lookup="salt-master"
      ) %}
{%-   set template = "" %}
{%- else %}
{%-   set source = "salt://" ~ tplroot ~ "/files/master.d" %}
{%-   set template = "jinja" %}
{%- endif %}

salt-master-config-files-file.recurse:
  file.recurse:
    - name: {{ salt_settings.config_path }}/master.d
    - source: {{ source }}
    - template: {{ template }}
    - clean: {{ salt_settings.clean_config_d_dir }}
    - exclude_pat:
      - _*
      - raas.conf
    - require:
      - sls: {{ sls_windows_excluded }}
      - sls: {{ sls_package_install }}

{%- if salt_settings.master_remove_config %}
salt-master-config-files-remove-old-master-conf-file.absent:
  file.absent:
    - name: {{ salt_settings.config_path }}/master
    - require:
      - sls: {{ sls_windows_excluded }}
      - sls: {{ sls_package_install }}
{%- endif %}

# clean up old _defaults.conf file if they have it around
salt-master-config-files-remove-old-default-master-conf-file.absent:
  file.absent:
    - name: {{ salt_settings.config_path }}/master.d/_defaults.conf

{%- if grains.os == "MacOS" %}
salt-master-config-files-macos-LaunchDaemons-file.managed:
  file.managed:
    - name: /Library/LaunchDaemons/com.saltstack.salt.master.plist
    - source: https://raw.githubusercontent.com/saltstack/salt/master/pkg/osx/scripts/com.saltstack.salt.master.plist
    - source_hash: {{ salt_settings.salt_master_macos_plist_hash }}
    - retry: {{ salt_settings.retry_options | json }}
    - require:
      - sls: {{ sls_package_install }}
{%- endif %}
