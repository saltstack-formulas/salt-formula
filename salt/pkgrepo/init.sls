{% if grains['os_family'] == 'Debian' %}
include:
  - .{{ grains['os']|lower }}
{% endif %}
