{%- set tplroot = tpldir.split('/')[0] %}
{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.hold_version is defined and salt_settings.install_packages %}
include:
  - .hold
{% endif %}

{% if salt_settings.install_packages %}
ensure-salt-ssh-is-installed:
  pkg.installed:
    - name: {{ salt_settings.salt_ssh }}
  {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
  {%- endif %}
  {%- if salt_settings.hold_version is defined %}
    - hold: {{ salt_settings.hold_version }}
  {%- endif %}
  {%- if salt_settings.update_holds is defined %}
    - update_holds: {{ salt_settings.update_holds }}
  {%- endif %}
{% endif %}

ensure-roster-config:
  file.managed:
    - name: {{ salt_settings.config_path }}/roster
    - source: salt://{{ tplroot }}/files/roster.jinja
    - template: jinja
{% if salt_settings.install_packages %}
    - require:
      - pkg: ensure-salt-ssh-is-installed
{% endif %}
