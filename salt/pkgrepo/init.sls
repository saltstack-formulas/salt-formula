{% set name = {
    'RedHat': 'redhat',
    'Debian': grains['os']|lower,
}.get(grains.os_family) %}
include:
  - .{{ name }}
