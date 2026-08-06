{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.install_packages %}
api_installed:
  module_and_function: pkg.version
  args:
    - {{ salt_settings.salt_api }}
  {%- if salt_settings.version is defined %}
  assertion: assertEqual
  expected-return: {{ salt_settings.version }}
  {% else %}
  assertion: assertNotEmpty
  {%- endif %}
{% endif %}

api_running:
  module_and_function: service.status
  args:
    - {{ salt_settings.api_service }}
  assertion: assertTrue

api_enabled:
  module_and_function: service.enabled
  args:
    - {{ salt_settings.api_service }}
  assertion: assertTrue
