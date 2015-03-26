{% from "salt/map.jinja" import salt_settings with context %}

salt-master:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_master }}
{% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path }}/master.d
    - template: jinja
    - source: salt://salt/files/master.d
    - clean: {{ salt_settings.clean_config_d_dir }}
  service.running:
    - enable: True
    - name: {{ salt_settings.master_service }}
    - watch:
{% if salt_settings.install_packages %}
      - pkg: salt-master
{% endif %}
      - file: salt-master
