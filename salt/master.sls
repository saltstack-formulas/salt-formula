{% from "salt/map.jinja" import salt_settings with context %}

salt-master:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_master }}
{% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path }}/master.d
    - template: jinja
    - source: salt://{{ slspath }}/files/master.d
    - clean: {{ salt_settings.clean_config_d_dir }}
    - exclude_pat: _*
  service.running:
    - enable: True
    - name: {{ salt_settings.master_service }}
    - watch:
{% if salt_settings.install_packages %}
      - pkg: salt-master
{% endif %}
      - file: salt-master
      - file: remove-old-master-conf-file

# clean up old _defaults.conf file if they have it around
remove-old-master-conf-file:
  file.absent:
    - name: /etc/salt/master.d/_defaults.conf
