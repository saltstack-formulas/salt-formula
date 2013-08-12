salt-master:
  pkg.installed:
    {% if grains['os_family'] in ['RedHat', 'Debian'] %}
    - name: salt-minion
    {% else %}
    - name: salt
    {% endif %}
  file.managed:
    - name: /etc/salt/master
    - template: jinja
    - source: salt://salt/files/master
  service.running:
    - enable: True
    - require:
      - pkg: salt-minion
    - watch:
      - file: salt-minion
