salt
====

Yes, Salt can Salt itself!

salt.minion
===========

Install a minion

salt.master
===========

Install a master.

Configuration
=============
Every option available in the templates can be set in pillar. Settings under 'salt' will be overridden by more specific settings under salt['master'] or salt['minion']

::

    salt:
      ret_port: 4506
      master:
        user: saltuser
        ...
      minion:
        user: saltuser
        ...
