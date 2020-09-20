{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{% if salt_settings.pin_version and salt_settings.version and grains.os_family|lower == 'debian' %}
include:
  - .pin
{% endif %}

{%- if grains.kernel != 'Windows' %}

    {%- if grains.os == 'MacOS' %}
salt-master-macos:
  file.managed:
    - name: /Library/LaunchDaemons/com.saltstack.salt.master.plist
    - source: https://raw.githubusercontent.com/saltstack/salt/master/pkg/osx/scripts/com.saltstack.salt.master.plist
    - source_hash: {{ salt_settings.salt_master_macos_plist_hash }}
    - retry:
        attempts: 2
        until: True
        interval: 10
        splay: 10
    - require_in:
      - service: salt-master
    {%- endif %}

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
           {%- if grains.kernel|lower == 'darwin' %}
      - file: salt-master-macos
           {%- else %}
      - file: salt-master
           {%- endif %}
      - file: remove-old-master-conf-file
    - order: last
    {% endif %}
    {% if salt_settings.master_remove_config %}
remove-default-master-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/master
    - watch_in:
      - service: salt-master
    {% endif %}

# clean up old _defaults.conf file if they have it around
remove-old-master-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/master.d/_defaults.conf

{%- else %}

salt-master-install-skip:
  test.show_notification:
    - text: |
        No salt-master state for Windows

{%- endif %}
