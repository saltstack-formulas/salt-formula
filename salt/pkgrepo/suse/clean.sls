# -*- coding: utf-8 -*-
# vim: ft=sls

salt-pkgrepo-clean-saltstack-suse:
  pkgrepo.absent:
    - name: systemsmanagement_saltstack_products
