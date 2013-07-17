salt-minion:
  pkg.installed:
    {% if grains['os_family'] in ['RedHat', 'Debian'] %}
    - name: salt-minion
    {% else %}
    - name: salt
    {% endif %}
  file.managed:
    - name: /etc/salt/minion
    - template: jinja
    - source: salt://salt/files/minion
  service.running:
    - enable: True
    - require:
      - pkg: salt-minion
    - watch:
      - file: salt-minion
