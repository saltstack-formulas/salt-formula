# -*- coding: utf-8 -*-
# vim: ft=sls

salt-pkgrepo-clean-saltstack-redhat:
  pkgrepo.absent:
    - name: saltstack
