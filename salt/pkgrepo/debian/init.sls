saltstack-apt-key:
  file.managed:
    - name: /etc/apt/trusted.gpg.d/saltstack.gpg
    - source: salt://{{ slspath }}/saltstack.gpg
    - user: root
    - group: root
    - mode: 644

saltstack-pkgrepo:
  file.managed:
    - name: /etc/apt/sources.list.d/saltstack.list
    - source: salt://{{ slspath }}/sources.list
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - file: saltstack-apt-key
    # Order: 1 because we can't put a require_in on "pkg: salt-{master,minion}"
    # because we don't know if they are used.
    - order: 1
