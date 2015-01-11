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
        standalone: False
  service.running:
    - enable: True
    - name: {{ salt.get('minion-service', 'salt-minion') }}
    - watch:
      - pkg: salt-minion
      - file: salt-minion
