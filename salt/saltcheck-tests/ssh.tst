{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.install_packages %}
salt_ssh_installed:
  module_and_function: pkg.version
  args:
    - {{ salt_settings.salt_ssh }}
  {%- if salt_settings.version is defined %}
  assertion: assertEqual
  expected-return: {{ salt_settings.version }}
  {% else %}
  assertion: assertNotEmpty
  {%- endif %}
{% endif %}

roster_deployed:
  module_and_function: file.search
  args:
    - {{ salt_settings.config_path }}/roster
    - This file is managed by Salt! Do not edit by hand!
  assertion: assertTrue
