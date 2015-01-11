{% from "salt/map.jinja" import salt with context %}

salt-minion:
  pkg.installed:
    - name: {{ salt['salt-minion'] }}
  file.recurse:
    - name: {{ salt.get('config-path', '/etc/salt') }}/minion.d
    - template: jinja
    - source: salt://salt/files/minion.d
    - clean: True
    - context:
        standalone: True
  service.dead:
    - enable: False
    - name: {{ salt.get('minion-service', 'salt-minion') }}
    - require:
      - pkg: salt-minion
      - file: salt-minion
