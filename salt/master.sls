{% from "salt/package-map.jinja" import pkgs with context %}

salt-master:
{% if not salt['pillar.get']('salt:no_install_packages', False) %}
  pkg.installed:
    - name: {{ pkgs['salt-master'] }}
{% endif %}
  file.managed:
    - name: /etc/salt/master
    - template: jinja
    - source: salt://salt/files/master
  service.running:
    - enable: True
    - watch:
{% if not salt['pillar.get']('salt:no_install_packages', False) %}
      - pkg: salt-master
{% endif %}
      - file: salt-master
