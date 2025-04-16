{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}

{% if salt_settings.pin_version and salt_settings.version and grains.os_family|lower == 'debian' %}
salt-pin-version:
  file.managed:
    - name: /etc/apt/preferences.d/salt
    - contents: |
        # This file managed by Salt, do not edit by hand!!
        Package: salt*
        Pin: version {{ salt_settings.version }}
        Pin-Priority: 1000
    # Order: 2 because we can't put a require_in on "pkg: salt-{master,minion}"
    # because we don't know if they are used, and 'order: 1' already occupied by salt-pkgrepo
    - order: 2

{% elif grains.os_family|lower != 'debian' %}
salt-pin-version:
  test.show_notification:
    - name: Available on Debian family OS-es only
    - text: Apt pinning available only on Debian based distributives
{% endif %}
