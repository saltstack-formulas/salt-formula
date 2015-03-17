{% from "salt/map.jinja" import salt_settings with context %}

salt-master:
  pkg.installed:
    - name: {{ salt_settings.salt_master }}
  file.recurse:
    - name: {{ salt_settings.config_path }}/master.d
    - template: jinja
    - source: salt://salt/files/master.d
    - clean: True
  service.running:
    - enable: True
    - name: {{ salt_settings.master_service }}
    - watch:
      - pkg: salt-master
      - file: salt-master
