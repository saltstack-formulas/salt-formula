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

configure-salt-master:
  file.managed:
    - name: /etc/salt/master
    - source: salt://salt/templates/master.template
    - template: jinja
    - user: root
    - groupt: root
    - mode: 0700

run-salt-master:
  cmd.wait:
    - name: start salt-master
    - watch:
      - file: run-salt-master
    - require:
      - file: configure-salt-master
  file.managed:
    - name: /etc/init/salt-master
    - source: salt://salt/templates/upstart-master.conf
    - template: jinja
    - defaults:
        run_mode: master
