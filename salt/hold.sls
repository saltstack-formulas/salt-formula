{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}

{% if salt_settings.hold_version is defined and grains.os_family|lower == 'redhat' %}
salt-install-hold-plugin:
  pkg.installed:
  {% if grains.osmajorrelease > 7 %}
    - name: python3-dnf-plugin-versionlock
  {% else %}
    - name: yum-plugin-versionlock
  {% endif %}
{% endif %}
