salt-master:
  pkg.installed:
    {% if grains['os_family'] in ['RedHat', 'Debian'] %}
    - name: salt-master
    {% else %}
    - name: salt
    {% endif %}
  file.managed:
    - name: /etc/salt/master
    - template: jinja
    - source: salt://salt/files/master
  service.running:
    - enable: True
    - watch:
      - pkg: salt-master
      - file: salt-master
