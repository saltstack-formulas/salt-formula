{% from "salt/map.jinja" import salt_settings with context %}

salt-minion:
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
  file.recurse:
    - name: {{ salt_settings.config_path }}/minion.d
    - template: jinja
    - source: salt://salt/files/minion.d
    - clean: {{ salt_settings.clean_config_d_dir }}
    - context:
        standalone: False
  service.running:
    - enable: True
    - name: {{ salt_settings.minion_service }}
    - watch:
      - pkg: salt-minion
      - file: salt-minion
