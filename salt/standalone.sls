{% from "salt/map.jinja" import salt_settings with context %}

salt-minion:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
{% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path }}/minion.d
    - template: jinja
    - source: salt://salt/files/minion.d
    - clean: {{ salt_settings.clean_config_d_dir }}
    - context:
        standalone: True
  service.dead:
    - enable: False
    - name: {{ salt_settings.minion_service }}
    - require:
{% if salt_settings.install_packages %}
      - pkg: salt-minion
{% endif %}
      - file: salt-minion
