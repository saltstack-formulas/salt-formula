{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.install_packages %}
minion_installed:
  module_and_function: pkg.version
  args:
    - {{ salt_settings.salt_minion }}
  {%- if salt_settings.version is defined %}
  assertion: assertEqual
  expected-return: {{ salt_settings.version }}
  {% else %}
  assertion: assertNotEmpty
  {%- endif %}
{% endif %}

minion_running:
  module_and_function: service.status
  args:
    - {{ salt_settings.minion_service }}
  assertion: assertTrue

minion_enabled:
  module_and_function: service.enabled
  args:
    - {{ salt_settings.minion_service }}
  assertion: assertTrue

minion_conf_deployed:
  module_and_function: file.search
  args:
    - {{ salt_settings.config_path }}/master.d/f_defaults.conf
    - This file managed by Salt, do not edit by hand!!
  assertion: assertTrue

{% if salt_settings.minion_remove_config %}
default-minion-conf-removed:
  module_and_function: file.file_exists
  args:
    - {{ salt_settings.config_path }}/minion
  assertion: assertFalse
{% endif %}

old-minion-conf-removed:
  module_and_function: file.file_exists
  args:
    - {{ salt_settings.config_path }}/minion
  assertion: assertFalse

{% if 'inotify' in  salt_settings.get('minion', {}).get('beacons', {}) and salt_settings.get('pyinotify', False) %}
inotify_installed:
  module_and_function: pkg.version
  args:
    - {{ salt_settings.pyinotify }}
  assertion: assertNotEmpty
{% endif %}
