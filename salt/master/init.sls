# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}

include:
  - .package
  - .config
  - .service

{#- Be backward compatible #}
{%- if grains.kernel != 'Windows' %}
{%-   if grains.os == "MacOS" %}
salt-master-macos:
  test.show_notification:
    - name: salt-master-macos
    - text: Backward compatible state for {{
      "'sls:" ~ tplroot ~ ".master.config.files => "
      ~ "salt-master-config-files-macos-LaunchDaemons-file.managed'"
      }}
{%-   endif %}

{%- set old_states_names = [
      "'sls:" ~ tplroot ~ ".master.package.install => "
      ~ "salt-master-package-install-pkg.installed'",
      "'sls:" ~ tplroot ~ ".master.config.files => "
      ~ "salt-master-config-files-file.recurse'",
      "'sls:" ~ tplroot ~ ".master.service",
    ] %}
salt-master:
  test.show_notification:
    - name: salt-master
    - text: Backward compatible state for {{ old_states_names | join(", ") }}

{%-   if salt_settings.master_remove_config %}
remove-default-master-conf-file:
  test.show_notification:
    - name: remove-default-master-conf-file
    - text: Backward compatible state for {{
      "'sls:" ~ tplroot ~ ".master.config.files => "
      ~ "salt-master-config-files-remove-old-master-conf-file.absent'"
      }}
{%-   endif %}

remove-old-master-conf-file:
  test.show_notification:
    - name: remove-old-master-conf-file
    - text: Backward compatible state for {{
      "'sls:" ~ tplroot ~ ".master.config.files => "
      ~ "salt-master-config-files-remove-old-default-master-conf-file.absent'"
      }}
{%- endif %}
