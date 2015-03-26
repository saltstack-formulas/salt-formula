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

``salt.ssh``
------------

Install salt-ssh with roster file.
Configure pillar data under salt:ssh_roster to feed the template.

``salt.api``
------------

Install salt api
Requisite: Configure salt-master with rest_cherrypy or rest_tornado.

``salt.standalone``
-------------------

Install a minion and configure it in `standalone mode
<http://docs.saltstack.com/en/latest/topics/tutorials/standalone_minion.html>`_.

``salt.gitfs.dulwich``
----------------------

Install gitfs backend dulwich dependencies. Set ``salt:master:gitfs_provider: dulwich`` in your pillar.

``salt.gitfs.gitpython``
----------------------

Install gitfs backend GitPython dependenciess. Set ``salt:master:gitfs_provider: gitpython`` in your pillar.

``salt.gitfs.pygit2``
----------------------

Install gitfs backend libgit2/pygit2 dependenciess. Set ``salt:master:gitfs_provider: pygit2`` in your pillar.

``salt.pkgrepo``
----------------

Enable the official saltstack package repository in order to always
benefit from the latest version. This state currently only works on Debian
and Ubuntu, and aims to implement the `installation recommendations of the
official documentation
<http://docs.saltstack.com/en/latest/topics/installation/index.html#platform-specific-installation-instructions>`_.

``salt.pkgrepo.absent``
-----------------------

Undo the effects of ``salt.pkgrepo``.

``salt.formulas``
-----------------

Clone selected `Salt formulas
<http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_
Git repositories under ``/srv/formulas`` and makes them available in the
relevant ``file_roots`` settings. Pillar data can be used to customize all
paths, URLs, etc.

Here's a minimal pillar sample installing two formulas in the base
environment.

::

    salt_formulas:
      list:
        base:
          - salt-formula
          - openssh-formula

See pillar.example for an exhaustive list of settings available via pillar. Note
that by default this state:

- downloads the latest formulas from the `saltstack-formulas project
  <https://github.com/saltstack-formulas>`_ on GitHub.
- does not update the local repositories after the initial clone.
  This is a safety measure since you do not control how the official
  repositories evolve.

If you configure the state to download the formulas from repositories that
you control, then you can safely enable the
``salt_formulas:git_opts:default:update`` pillar setting to ``True``.

``Configuration``
=================
Every option available in the templates can be set in pillar. Settings under 'salt' will be overridden by more specific settings under ``salt['master']``, ``salt['minion']`` or ``salt['cloud']``

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

``Extending``
=============
Additional templates can be added by the user under salt/files/minion.d and master.d. This might be useful if, for example, a recently-added configuration option is not yet provided by the default template.

``Vagrant``
===========

Executing the provided `Vagrantfile <http://www.vagrantup.com/>`_  will create a Ubuntu 14.04 VM, add the default Saltstack Repository and install the current stable version.

The folders inside the VM will be set up in a way that enables you to simply execute 'sudo salt "*" state.highstate' to apply the salt formula to the VM, using the pillar.example config. You can check /etc/salt/ for results.

Remember, you will have to run ``state.highstate`` or ``state.sls salt.(master|minion|cloud)`` manually.
