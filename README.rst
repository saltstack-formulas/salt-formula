salt
====

Yes, Salt can Salt itself!

salt.minion
===========

Install a minion

salt.master
===========

Install a master. Every option available in the master template can be set in the pillar file:

::

    salt:
      ret_port: 4506
      master:
        user: saltuser
        ...
      minion:
        user: saltuser
        ...
