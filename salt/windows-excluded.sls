# -*- coding: utf-8 -*-
# vim: ft=sls

{%- if grains.kernel == 'Windows' %}
salt-windows-excluded-testfail_without_changes:
  test.fail_without_changes:
    - name: Verify that current platform is not Windows
    - comment: Platform Windows is not supported
{%- else %}
{#-   Workaround https://github.com/saltstack/salt/issues/10852 #}
salt-windows-excluded-test.succeed_without_changes:
  test.succeed_without_changes:
    - name: Verify that current platform is not Windows
    - comment: Platform {{ grains.kernel }} is supported
{%- endif %}
