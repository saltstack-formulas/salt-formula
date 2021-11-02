# -*- coding: utf-8 -*-
# vim: ft=yaml
---
salt:
  py_ver: 'py3'
  # Override used for FreeBSD minion service
  retry_options:
    attempts: 5
  master:
    fileserver_backend:
      - rootfs
    file_roots:
      base:
        - /srv/salt
    pillar_roots:
      base:
        - /srv/pillar
    ext_pillar:
      - cmd_yaml: cat /etc/salt/yaml
      - stack:
          - /path/to/stack1.cfg
          - /path/to/stack2.cfg
      - reclass:
          inventory_base_uri: /etc/reclass
      - saltclass:
          - path: /srv/saltclass
  minion:
    master: localhost
    fileserver_backend:
      - rootfs
    file_roots:
      base:
        - /srv/salt
    pillar_roots:
      base:
        - /srv/pillar

# Gentoo-specific, improves performance for subsequent test runs within the same day
portage:
  sync_wait_one_day: true
