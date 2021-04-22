# -*- coding: utf-8 -*-
# vim: ft=yaml
---
salt:
  release: '3003'
  py_ver: 'py3'

  # Override used for FreeBSD minion service
  retry_options:
    attempts: 5
    until: true
    interval: 10
    splay: 10
