====
salt
====

Yes, Salt can Salt itself!

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``salt.minion``
---------------

Install a minion

``salt.master``
---------------

Install a master.

``salt.syndic``
---------------

Install a syndic.

``salt.cloud``
---------------

Install salt cloud.

``Configuration``
-----------------
Every option available in the templates can be set in pillar. Settings under 'salt' will be overridden by more specific settings under salt['master'], salt['minion'] or salt['cloud']

::

    salt:
      ret_port: 4506
      master:
        user: saltuser
        ...
      minion:
        user: saltuser
        ...
      cloud:
        providers: ec2
        ...
