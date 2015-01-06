drop-saltstack-pkgrepo:
  file.absent:
    - name: /etc/apt/sources.list.d/saltstack.list

drop-saltstack-apt-key:
  file.absent:
    - name: /etc/apt/trusted.gpg.d/saltstack.gpg
