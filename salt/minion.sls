{% from "salt/package-map.jinja" import pkgs with context %}

salt-minion:
{% if not salt['pillar.get']('salt:no_install_packages', False) %}
  pkg.installed:
    - name: {{ pkgs['salt-minion'] }}
{% endif %}
  file.managed:
    - name: /etc/salt/minion
    - template: jinja
    - source: salt://salt/files/minion
  service.running:
    - enable: True
    - watch:
{% if not salt['pillar.get']('salt:no_install_packages', False) %}
      - pkg: salt-minion
{% endif %}
      - file: salt-minion
