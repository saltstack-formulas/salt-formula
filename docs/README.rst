.. _readme:

salt-formula
============

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/salt-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/salt-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Yes, Salt can Salt itself!

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Available states
----------------

.. contents::
   :local:

``salt``
^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This calls all runable states based on configured pillar data.

``salt.minion``
^^^^^^^^^^^^^^^

Install a minion

``salt.master``
^^^^^^^^^^^^^^^

Install a master.

``salt.syndic``
^^^^^^^^^^^^^^^

Install a syndic.

``salt.cloud``
^^^^^^^^^^^^^^

Install salt cloud.

``salt.ssh``
^^^^^^^^^^^^

Install salt-ssh with roster file.
Configure pillar data under salt:ssh_roster to feed the template.

``salt.api``
^^^^^^^^^^^^

Install salt api
Requisite: Configure salt-master with rest_cherrypy or rest_tornado.

``salt.standalone``
^^^^^^^^^^^^^^^^^^^

Install a minion and configure it in `standalone mode
<http://docs.saltstack.com/en/latest/topics/tutorials/standalone_minion.html>`_.

``salt.gitfs.dulwich``
^^^^^^^^^^^^^^^^^^^^^^

Install gitfs backend dulwich dependencies. Set ``salt:master:gitfs_provider: dulwich`` in your pillar.

``salt.gitfs.gitpython``
^^^^^^^^^^^^^^^^^^^^^^^^

Install gitfs backend GitPython dependenciess. Set ``salt:master:gitfs_provider: gitpython`` in your pillar.

``salt.gitfs.keys``
^^^^^^^^^^^^^^^^^^^

Install ssh keys to be used by gitfs

``salt.gitfs.pygit2``
^^^^^^^^^^^^^^^^^^^^^

Install gitfs backend libgit2/pygit2 dependenciess. Set ``salt:master:gitfs_provider: pygit2`` in your pillar.
For EL distributions, pygit is installed from packages from `EPEL <https://github.com/saltstack-formulas/epel-formula>`_.

``salt.pkgrepo``
^^^^^^^^^^^^^^^^

It is recommended to use SaltStack repository for Debian, RedHat, and SuSE, to benefit from the latest stable salt release. Refer to official documentation at <http://docs.saltstack.com/en/latest/topics/installation/index.html#platform-specific-installation-instructions>`_.

``salt.pkgrepo.clean``
^^^^^^^^^^^^^^^^^^^^^^^

Undo the effects of ``salt.pkgrepo`` on Debian, RedHat, and SuSE.

``salt.formulas``
^^^^^^^^^^^^^^^^^

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


Configuration
-------------

Every option available in the templates can be set in pillar. Settings under 'salt' will be overridden by more specific settings under ``salt['master']``, ``salt['minion']`` or ``salt['cloud']``. Options specified in ``salt['minion']`` which are not present in the default configuration file will be added to the end of the configuration file.

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

Extending
---------

Additional templates can be added by the user under salt/files/minion.d and master.d. This might be useful if, for example, a recently-added configuration option is not yet provided by the default template.

Vagrant
-------

Executing the provided `Vagrantfile <http://www.vagrantup.com/>`_  will create a Ubuntu 14.04 VM, add the default Saltstack Repository and install the current stable version.

The folders inside the VM will be set up in a way that enables you to simply execute 'sudo salt "*" state.highstate' to apply the salt formula to the VM, using the pillar.example config. You can check /etc/salt/ for results.

Remember, you will have to run ``state.highstate`` or ``state.sls salt.(master|minion|cloud)`` manually.

MacOS Support
-------------

As MacOS has no native package management that pkg.installed can leverage appropriately, and brew does not count, the salt.minion state  manages salt minion package upgrades by way of .pkg file download which is then installed using the macpackage.installed state.

salt-minion packages on MacOS will not be upgraded by default. To enable package management you must set the following at a minimum,

::

    install_packages: True
    version: 2017.7.4
    salt_minion_pkg_source: https://repo.saltstack.com/osx/salt-2017.7.4-py3-x86_64.pkg

install_packages must indicate that the installation of a package is desired. If so, version will be used to compare the version of the installed .pkg against the downloaded one. If version is not set and a salt.pkg is already installed the .pkg will not be installed again.

A future update to the formula may include extraction of version from the downloaded .pkg itself; but for the time being you MUST set version to indicate what you believe it to be.

Refer to pillar.example for more information.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``salt`` main states, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.
