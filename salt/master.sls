{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{% if salt_settings.pin_version and salt_settings.version and grains.os_family|lower == 'debian' %}
include:
  - .pin
{% endif %}

salt-master:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_master }}
  {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
  {%- endif %}
{% if salt_settings.master_service_details.state != 'ignore' %}
    - require_in:
      - service: salt-master
    - watch_in:
      - service: salt-master
{% endif %}
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
{% if salt_settings.master_service_details.state != 'ignore' %}
  service.{{ salt_settings.master_service_details.state }}:
    - enable: {{ salt_settings.master_service_details.enabled }}
    - name: {{ salt_settings.master_service }}
    - watch:
      - file: salt-master
      - file: remove-old-master-conf-file
{% endif %}
{% if salt_settings.master_remove_config %}
remove-default-master-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/master
{% endif %}

# clean up old _defaults.conf file if they have it around
remove-old-master-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/master.d/_defaults.conf
