{% from "salt/map.jinja" import salt_settings, sls_block with context %}

{% if salt_settings.install_packages %}
ensure-salt-ssh-is-installed:
  pkg.installed:
    - name: {{ salt_settings.salt_ssh }}
    {{ sls_block(salt_settings.package.opts) }}
{% endif %}

ensure-roster-config:
  file.managed:
    - name: {{ salt_settings.config_path }}/roster
    - source: salt://{{ slspath }}/files/roster.jinja
    - template: jinja
{% if salt_settings.install_packages %}
    - require:
      - pkg: ensure-salt-ssh-is-installed
{% endif %}
