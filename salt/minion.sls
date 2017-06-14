{% from "salt/map.jinja" import salt_settings with context %}

salt-minion:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
{% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path }}/minion.d
    - template: jinja
    - source: salt://{{ slspath }}/files/minion.d
    - clean: {{ salt_settings.clean_config_d_dir }}
    - exclude_pat: _*
    - context:
        standalone: False
  service.running:
    - enable: True
    - name: {{ salt_settings.minion_service }}
{%- if not salt_settings.restart_via_at %}
    - watch:
  {%- if salt_settings.install_packages %}
      - pkg: salt-minion
  {%- endif %}
      - file: salt-minion
      - file: remove-old-minion-conf-file
{%- else %}
at:
  pkg.installed: []

restart-salt-minion:
  cmd.wait:
    - name: echo salt-call --local service.restart salt-minion | at now + 1 minute
    - order: last
    - reqiure:
        - pkg: at
    - watch:
  {%- if salt_settings.install_packages %}
      - pkg: salt-minion
  {%- endif %}
      - file: salt-minion
      - file: remove-old-minion-conf-file
{%- endif %}

{% if salt_settings.minion_remove_config %}
remove-default-minion-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/minion
{% endif %}

# clean up old _defaults.conf file if they have it around
remove-old-minion-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/minion.d/_defaults.conf
