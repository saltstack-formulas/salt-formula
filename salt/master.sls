{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

salt-master:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_master }}
  {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
  {%- endif %}
    - require_in:
      - service: salt-master
    - watch_in:
      - service: salt-master
{% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path }}/master.d
    {%- if salt_settings.master_config_use_TOFS %}
    - template: ''
    - source: {{ files_switch(['master.d'],
                              lookup='salt-master'
                 )
              }}
    {%- else %}
    - template: jinja
    - source: salt://{{ tplroot }}/files/master.d
    {%- endif %}
    - clean: {{ salt_settings.clean_config_d_dir }}
    - exclude_pat: _*
  service.running:
    - enable: True
    - name: {{ salt_settings.master_service }}
    - watch:
      - file: salt-master
      - file: remove-old-master-conf-file

{% if salt_settings.master_remove_config %}
remove-default-master-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/master
{% endif %}

# clean up old _defaults.conf file if they have it around
remove-old-master-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/master.d/_defaults.conf
