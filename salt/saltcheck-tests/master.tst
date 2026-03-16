{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.install_packages %}
master_installed:
  module_and_function: pkg.version
  args:
    - {{ salt_settings.salt_master }}
  {%- if salt_settings.version is defined %}
  assertion: assertEqual
  expected-return: {{ salt_settings.version }}
  {% else %}
  assertion: assertNotEmpty
  {%- endif %}
{% endif %}

master_running:
  module_and_function: service.status
  args:
    - {{ salt_settings.master_service }}
  assertion: assertTrue

master_enabled:
  module_and_function: service.enabled
  args:
    - {{ salt_settings.master_service }}
  assertion: assertTrue

master_conf_deployed:
  module_and_function: file.search
  args:
    - {{ salt_settings.config_path }}/master.d/f_defaults.conf
    - This file managed by Salt, do not edit by hand
  assertion: assertTrue

{% if salt_settings.master_remove_config %}
default-master-conf-removed:
  module_and_function: file.file_exists
  args:
    - {{ salt_settings.config_path }}/master
  assertion: assertFalse
{% endif %}

old-master-conf-removed:
  module_and_function: file.file_exists
  args:
    - {{ salt_settings.config_path }}/master.d/_defaults.conf
  assertion: assertFalse
