{% set name = {
    'RedHat': 'redhat',
    'Debian': grains['os_family']|lower,
}.get(grains.os_family) %}
include:
  - .{{ name }}
