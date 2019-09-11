# -*- coding: utf-8 -*-
# vim: ft=yaml
---
salt:
  master:
    fileserver_backend:
      - rootfs
    file_roots:
      base:
        - /srv/salt
    pillar_roots:
      base:
        - /srv/pillar
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
