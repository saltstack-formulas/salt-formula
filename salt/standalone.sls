{%- set tplroot = tpldir.split('/')[0] %}
{% from "salt/map.jinja" import salt_settings with context %}

salt-minion-standalone:
  {% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
     {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
     {%- endif %}
  {% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path }}/minion.d
    - template: jinja
    - source: salt://{{ tplroot }}/files/minion.d
    - clean: {{ salt_settings.clean_config_d_dir }}
    - exclude_pat: _*
    - context:
        standalone: True
  {%- if not salt_settings.minion.master_type %}
  service.running:
    - enable: True
  {%- else %}
  service.dead:
    - enable: False
  {%- endif %}
    - name: {{ salt_settings.minion_service }}
    - require:
  {% if salt_settings.install_packages %}
      - pkg: salt-minion-standalone
  {% endif %}
      - file: salt-minion-standalone

# clean up old _defaults.conf file if they have it around
remove-old-standalone-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/minion.d/_defaults.conf
