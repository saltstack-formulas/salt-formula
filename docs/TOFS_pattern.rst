.. _tofs_pattern:

TOFS: A pattern for using SaltStack
===================================

.. list-table::
   :name: tofs-authors
   :header-rows: 1
   :stub-columns: 1
   :widths: 2,2,3,2

   * -
     - Person
     - Contact
     - Date
   * - Authored by
     - Roberto Moreda
     - moreda@allenta.com
     - 29/12/2014
   * - Modified by
     - Daniel Dehennin
     - daniel.dehennin@baby-gnu.org
     - 07/02/2019
   * - Modified by
     - Imran Iqbal
     - https://github.com/myii
     - 23/02/2019

All that follows is a proposal based on my experience with `SaltStack <http://www.saltstack.com/>`_. The good thing of a piece of software like this is that you can "bend it" to suit your needs in many possible ways, and this is one of them. All the recommendations and thoughts are given "as it is" with no warranty of any type.

.. contents:: **Table of Contents**

Usage of values in pillar vs templates in ``file_roots``
--------------------------------------------------------

Among other functions, the *master* (or *salt-master*) serves files to the *minions* (or *salt-minions*). The `file_roots <http://docs.saltstack.com/en/latest/ref/file_server/file_roots.html>`_ is the list of directories used in sequence to find a file when a minion requires it: the first match is served to the minion. Those files could be `state files <http://docs.saltstack.com/en/latest/topics/tutorials/starting_states.html>`_ or configuration templates, among others.

Using SaltStack is a simple and effective way to implement configuration management, but even in a `non-multitenant <http://en.wikipedia.org/wiki/Multitenancy>`_ scenario, it is not a good idea to generally access some data (e.g. the database password in our `Zabbix <http://www.zabbix.com/>`_ server configuration file or the private key of our `Nginx <http://nginx.org/en/>`_ TLS certificate).

To avoid this situation we can use the `pillar mechanism <http://docs.saltstack.com/en/latest/topics/pillar/>`_, which is designed to provide controlled access to data from the minions based on some selection rules. As pillar data could be easily integrated in the `Jinja <http://docs.saltstack.com/en/latest/topics/tutorials/pillar.html>`_ templates, it is a good mechanism to store values to be used in the final rendering of state files and templates.

There are a variety of approaches on the usage of pillar and templates as seen in the `saltstack-formulas <https://github.com/saltstack-formulas>`_' repositories. `Some <https://github.com/saltstack-formulas/nginx-formula/pull/18>`_ `developments <https://github.com/saltstack-formulas/php-formula/pull/14>`_ stress the initial purpose of pillar data into a storage for most of the possible variables for a determined system configuration. This, in my opinion, is shifting too much load from the original template files approach. Adding up some `non-trivial Jinja <https://github.com/saltstack-formulas/nginx-formula/blob/f74254c07e188bd448eaf1c5f9c802d78c4c005e/nginx/files/default/nginx.conf>`_ code as essential part of composing the state file definitely makes SaltStack state files (hence formulas) more difficult to read. The extreme of this approach is that we could end up with a new render mechanism, implemented in Jinja, storing everything needed in pillar data to compose configurations. Additionally, we are establishing a strong dependency with the Jinja renderer.

In opposition to the *put the code in file_roots and the data in pillars* approach, there is the *pillar as a store for a set of key-values* approach. A full-blown configuration file abstracted in pillar and jinja is complicated to develop, understand and maintain. I think a better and simpler approach is to keep a configuration file templated using just a basic (non-extensive but extensible) set of pillar values.

On the reusability of SaltStack state files
-------------------------------------------

There is a brilliant initiative of the SaltStack community called `salt-formulas <https://github.com/saltstack-formulas>`_. Their goal is to provide state files, pillar examples and configuration templates ready to be used for provisioning. I am a contributor for two small ones: `zabbix-formula <https://github.com/saltstack-formulas/zabbix-formula>`_ and `varnish-formula <https://github.com/saltstack-formulas/varnish-formula>`_.

The `design guidelines <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_ for formulas are clear in many aspects and it is a recommended reading for anyone willing to write state files, even non-formulaic ones.

In the next section, I am going to describe my proposal to extend further the reusability of formulas, suggesting some patterns of usage.

The Template Override and Files Switch (TOFS) pattern
-----------------------------------------------------

I understand a formula as a **complete, independent set of SaltStack state and configuration template files sufficient to configure a system**. A system could be something as simple as an NTP server or some other much more complex service that requires many state and configuration template files.

The customization of a formula should be done mainly by providing pillar data used later to render either the state or the configuration template files.

Example: NTP before applying TOFS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Let's work with the NTP example. A basic formula that follows the `design guidelines <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_ has the following files and directories tree:

.. code-block::

   /srv/saltstack/salt-formulas/ntp-saltstack-formula/
     ntp/
       map.jinja
       init.sls
       conf.sls
       files/
         default/
           etc/
             ntp.conf.jinja

In order to use it, let's assume a `masterless configuration <http://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html>`_ and this relevant section of ``/etc/salt/minion``:

.. code-block:: yaml

   pillar_roots:
     base:
       - /srv/saltstack/pillar
   file_client: local
   file_roots:
     base:
       - /srv/saltstack/salt
       - /srv/saltstack/salt-formulas/ntp-saltstack-formula

.. code-block:: jinja

   {#- /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/map.jinja #}
   {%- set ntp = salt['grains.filter_by']({
     'default': {
       'pkg': 'ntp',
       'service': 'ntp',
       'config': '/etc/ntp.conf',
     },
   }, merge=salt['pillar.get']('ntp:lookup')) %}

In ``init.sls`` we have the minimal states required to have NTP configured. In many cases ``init.sls`` is almost equivalent to an ``apt-get install`` or a ``yum install`` of the package.

.. code-block:: sls

   ## /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/init.sls
   {%- from 'ntp/map.jinja' import ntp with context %}

   Install NTP:
     pkg.installed:
       - name: {{ ntp.pkg }}

   Enable and start NTP:
     service.running:
       - name: {{ ntp.service }}
       - enabled: True
       - require:
         - pkg: Install NTP package

In ``conf.sls`` we have the configuration states. In most cases, that is just managing configuration file templates and making them to be watched by the service.

.. code-block:: sls

   ## /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/conf.sls
   include:
     - ntp

   {%- from 'ntp/map.jinja' import ntp with context %}

   Configure NTP:
     file.managed:
       - name: {{ ntp.config }}
       - template: jinja
       - source: salt://ntp/files/default/etc/ntp.conf.jinja
       - watch_in:
         - service: Enable and start NTP service
       - require:
         - pkg: Install NTP package

Under ``files/default``, there is a structure that mimics the one in the minion in order to avoid clashes and confusion on where to put the needed templates. There you can find a mostly standard template for the configuration file.

.. code-block:: jinja

   {#- /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/files/default/etc/ntp.conf.jinja #}
   {#- Managed by saltstack #}
   {#- Edit pillars or override this template in saltstack if you need customization #}
   {%- set settings = salt['pillar.get']('ntp', {}) %}
   {%- set default_servers = ['0.ubuntu.pool.ntp.org',
                             '1.ubuntu.pool.ntp.org',
                             '2.ubuntu.pool.ntp.org',
                             '3.ubuntu.pool.ntp.org'] %}

   driftfile /var/lib/ntp/ntp.drift
   statistics loopstats peerstats clockstats
   filegen loopstats file loopstats type day enable
   filegen peerstats file peerstats type day enable
   filegen clockstats file clockstats type day enable

   {%- for server in settings.get('servers', default_servers) %}
   server {{ server }}
   {%- endfor %}

   restrict -4 default kod notrap nomodify nopeer noquery
   restrict -6 default kod notrap nomodify nopeer noquery

   restrict 127.0.0.1
   restrict ::1

With all this, it is easy to install and configure a simple NTP server by just running ``salt-call state.sls ntp.conf``: the package will be installed, the service will be running and the configuration should be correct for most of cases, even without pillar data.

Alternatively, you can define a highstate in ``/srv/saltstack/salt/top.sls`` and run ``salt-call state.highstate``.

.. code-block:: sls

   ## /srv/saltstack/salt/top.sls
   base:
     '*':
       - ntp.conf

**Customizing the formula just with pillar data**, we have the option to define the NTP servers.

.. code-block:: sls

   ## /srv/saltstack/pillar/top.sls
   base:
     '*':
       - ntp

.. code-block:: sls

   ## /srv/saltstack/pillar/ntp.sls
   ntp:
     servers:
       - 0.ch.pool.ntp.org
       - 1.ch.pool.ntp.org
       - 2.ch.pool.ntp.org
       - 3.ch.pool.ntp.org

Template Override
^^^^^^^^^^^^^^^^^

If the customization based on pillar data is not enough, we can override the template by creating a new one in ``/srv/saltstack/salt/ntp/files/default/etc/ntp.conf.jinja``

.. code-block:: jinja

   {#- /srv/saltstack/salt/ntp/files/default/etc/ntp.conf.jinja #}
   {#- Managed by saltstack #}
   {#- Edit pillars or override this template in saltstack if you need customization #}

   {#- Some bizarre configurations here #}
   {#- ... #}

   {%- for server in settings.get('servers', default_servers) %}
   server {{ server }}
   {%- endfor %}

This way we are locally **overriding the template files** offered by the formula in order to make a more complex adaptation. Of course, this could be applied as well to any of the files, including the state files.

Files Switch
^^^^^^^^^^^^

To bring some order into the set of template files included in a formula, as we commented, we suggest having a similar structure to a normal final file system under ``files/default``.

We can make different templates coexist for different minions, classified by any `grain <http://docs.saltstack.com/en/latest/topics/targeting/grains.html>`_ value, by simply creating new directories under ``files``. This mechanism is based on **using values of some grains as a switch for the directories under** ``files/``.

If we decide that we want ``os_family`` as switch, then we could provide the formula template variants for both the ``RedHat`` and ``Debian`` families.

.. code-block::

   /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/files/
     default/
       etc/
         ntp.conf.jinja
     RedHat/
       etc/
         ntp.conf.jinja
     Debian/
       etc/
         ntp.conf.jinja

To make this work we need a ``conf.sls`` state file that takes a list of possible files as the configuration template.

.. code-block:: sls

   ## /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/conf.sls
   include:
     - ntp

   {%- from 'ntp/map.jinja' import ntp with context %}

   Configure NTP:
     file.managed:
       - name: {{ ntp.config }}
       - template: jinja
       - source:
         - salt://ntp/files/{{ grains.get('os_family', 'default') }}/etc/ntp.conf.jinja
         - salt://ntp/files/default/etc/ntp.conf.jinja
       - watch_in:
         - service: Enable and start NTP service
       - require:
         - pkg: Install NTP package

If we want to cover the possibility of a special template for a minion identified by ``node01`` then we could have a specific template in ``/srv/saltstack/salt/ntp/files/node01/etc/ntp.conf.jinja``.

.. code-block:: jinja

   {#- /srv/saltstack/salt/ntp/files/node01/etc/ntp.conf.jinja #}
   {#- Managed by saltstack #}
   {#- Edit pillars or override this template in saltstack if you need customization #}

   {#- Some crazy configurations here for node01 #}
   {#- ... #}

To make this work we could write a specially crafted ``conf.sls``.

.. code-block:: sls

   ## /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/conf.sls
   include:
     - ntp

   {%- from 'ntp/map.jinja' import ntp with context %}

   Configure NTP:
     file.managed:
       - name: {{ ntp.config }}
       - template: jinja
       - source:
         - salt://ntp/files/{{ grains.get('id') }}/etc/ntp.conf.jinja
         - salt://ntp/files/{{ grains.get('os_family') }}/etc/ntp.conf.jinja
         - salt://ntp/files/default/etc/ntp.conf.jinja
       - watch_in:
         - service: Enable and start NTP service
       - require:
         - pkg: Install NTP package

Using the ``files_switch`` macro
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We can simplify the ``conf.sls`` with the new ``files_switch`` macro to use in the ``source`` parameter for the ``file.managed`` state.

.. code-block:: sls

   ## /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/conf.sls
   include:
     - ntp

   {%- set tplroot = tpldir.split('/')[0] %}
   {%- from 'ntp/map.jinja' import ntp with context %}
   {%- from 'ntp/libtofs.jinja' import files_switch %}

   Configure NTP:
     file.managed:
       - name: {{ ntp.config }}
       - template: jinja
       - source: {{ files_switch(['/etc/ntp.conf.jinja'],
                                 lookup='Configure NTP'
                    )
                 }}
       - watch_in:
         - service: Enable and start NTP service
       - require:
         - pkg: Install NTP package


* This uses ``config.get``, searching for ``ntp:tofs:source_files:Configure NTP`` to determine the list of template files to use.
* If this returns a result, the default of ``['/etc/ntp.conf.jinja']`` will be appended to it.
* If this does not yield any results, the default of ``['/etc/ntp.conf.jinja']`` will be used.

In ``libtofs.jinja``, we define this new macro ``files_switch``.

.. literalinclude:: ../template/libtofs.jinja
   :caption: /srv/saltstack/salt-formulas/ntp-saltstack-formula/ntp/libtofs.jinja
   :language: jinja

How to customise the ``source`` further
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The examples below are based on an ``Ubuntu`` minion called ``theminion`` being configured via. pillar.

Using the default settings of the ``files_switch`` macro above,
the ``source`` will be:

.. code-block:: sls

         - source:
           - salt://ntp/files/theminion/etc/ntp.conf.jinja
           - salt://ntp/files/Debian/etc/ntp.conf.jinja
           - salt://ntp/files/default/etc/ntp.conf.jinja

Customise ``files``
~~~~~~~~~~~~~~~~~~~

The ``files`` portion can be customised:

.. code-block:: sls

   ntp:
     tofs:
       dirs:
         files: files_alt

Resulting in:

.. code-block:: sls

         - source:
           - salt://ntp/files_alt/theminion/etc/ntp.conf.jinja
           - salt://ntp/files_alt/Debian/etc/ntp.conf.jinja
           - salt://ntp/files_alt/default/etc/ntp.conf.jinja

Customise the use of grains
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Grains can be customised and even arbitrary paths can be supplied:

.. code-block:: sls

   ntp:
     tofs:
       files_switch:
         - any/path/can/be/used/here
         - id
         - os
         - os_family

Resulting in:

.. code-block:: sls

         - source:
           - salt://ntp/files/any/path/can/be/used/here/etc/ntp.conf.jinja
           - salt://ntp/files/theminion/etc/ntp.conf.jinja
           - salt://ntp/files/Ubuntu/etc/ntp.conf.jinja
           - salt://ntp/files/Debian/etc/ntp.conf.jinja
           - salt://ntp/files/default/etc/ntp.conf.jinja

Customise the ``default`` path
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``default`` portion of the path can be customised:

.. code-block:: sls

   ntp:
     tofs:
       dirs:
         default: default_alt

Resulting in:

.. code-block:: sls

         - source:
           ...
           - salt://ntp/files/default_alt/etc/ntp.conf.jinja

Customise the list of ``source_files``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The list of ``source_files`` can be given:

.. code-block:: sls

   ntp:
     tofs:
       source_files:
         Configure NTP:
           - '/etc/ntp.conf_alt.jinja'

Resulting in:

.. code-block:: sls

         - source:
           - salt://ntp/files/theminion/etc/ntp.conf_alt.jinja
           - salt://ntp/files/theminion/etc/ntp.conf.jinja
           - salt://ntp/files/Debian/etc/ntp.conf_alt.jinja
           - salt://ntp/files/Debian/etc/ntp.conf.jinja
           - salt://ntp/files/default/etc/ntp.conf_alt.jinja
           - salt://ntp/files/default/etc/ntp.conf.jinja

Note: This does *not* override the default value.
Rather, the value from the pillar/config is prepended to the default.

Using sub-directories for ``components``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If your formula is composed of several components, you may prefer to provides files under sub-directories, like in the `systemd-formula <https://github.com/saltstack-formulas/systemd-formula>`_.

.. code-block::

   /srv/saltstack/systemd-formula/
     systemd/
       init.sls
       libtofs.jinja
       map.jinja
       networkd/
         init.sls
         files/
           default/
             network/
               99-default.link
       resolved/
         init.sls
         files/
           default/
             resolved.conf
       timesyncd/
         init.sls
         files/
           Arch/
             resolved.conf
           Debian/
             resolved.conf
           default/
             resolved.conf
           Ubuntu/
             resolved.conf

For example, the following ``formula.component.config`` SLS:

.. code-block:: sls

   {%- from "formula/libtofs.jinja" import files_switch with context %}

   formula configuration file:
     file.managed:
       - name: /etc/formula.conf
       - user: root
       - group: root
       - mode: 644
       - template: jinja
       - source: {{ files_switch(['formula.conf'],
                                 lookup='formula',
                                 use_subpath=True
                    )
                 }}

will be rendered on a ``Debian`` minion named ``salt-formula.ci.local`` as:

.. code-block:: sls

   formula configuration file:
     file.managed:
       - name: /etc/formula.conf
       - user: root
       - group: root
       - mode: 644
       - template: jinja
       - source:
         - salt://formula/component/files/salt-formula.ci.local/formula.conf
         - salt://formula/component/files/Debian/formula.conf
         - salt://formula/component/files/default/formula.conf
         - salt://formula/files/salt-formula.ci.local/formula.conf
         - salt://formula/files/Debian/formula.conf
         - salt://formula/files/default/formula.conf
