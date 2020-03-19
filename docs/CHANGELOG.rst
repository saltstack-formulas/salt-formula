
Changelog
=========

`1.3.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.3.0...v1.3.1>`_ (2020-03-19)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **jinja:** replace version_cmp with grains lookup (\ `dd37869 <https://github.com/saltstack-formulas/salt-formula/commit/dd37869d2842927a87273b940fd76945ff6a05ec>`_\ )
* **jinja:** replace version_cmp with grains lookup (\ `325f6c0 <https://github.com/saltstack-formulas/salt-formula/commit/325f6c061beb2721cb55777e206922d728f62e69>`_\ )

`1.3.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.2.0...v1.3.0>`_ (2020-03-11)
------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **mapping:** better control of the service's state (\ `29ffd68 <https://github.com/saltstack-formulas/salt-formula/commit/29ffd68d3419b61b938221130911844f48134817>`_\ )

`1.2.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.1.3...v1.2.0>`_ (2020-02-20)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **libtofs:** “files_switch” mess up the variable exported by “map.jinja” [skip ci] (\ `4955737 <https://github.com/saltstack-formulas/salt-formula/commit/4955737f844678ca3ca208340fe73fcd47aab256>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis+inspec:** fix ``amazonlinux-2-py3`` [skip ci] (\ `10e2ce0 <https://github.com/saltstack-formulas/salt-formula/commit/10e2ce07a4293ad46d785bcbc16b822280f17142>`_\ )

Features
^^^^^^^^


* **metastate:** add metastate per community convention (\ `fbaa456 <https://github.com/saltstack-formulas/salt-formula/commit/fbaa456ca69fafa2a8a4ef910b5e09dafffe5ece>`_\ )

`1.1.3 <https://github.com/saltstack-formulas/salt-formula/compare/v1.1.2...v1.1.3>`_ (2020-02-13)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **tpl_path:** replace slspath to tplroot (\ `bbcc4cd <https://github.com/saltstack-formulas/salt-formula/commit/bbcc4cda7ada4470db07dc02a5938a5b650e2f1c>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `d2d5186 <https://github.com/saltstack-formulas/salt-formula/commit/d2d51864a5e4e5584afa979378ded15b1c5b9366>`_\ )

`1.1.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.1.1...v1.1.2>`_ (2020-01-25)
------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* **mapping:** simplify py version handling (\ `715e3b8 <https://github.com/saltstack-formulas/salt-formula/commit/715e3b8fa495ed2c8e9f4a5fbbb6398021ac9ec7>`_\ )

`1.1.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.1.0...v1.1.1>`_ (2020-01-24)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **travis:** use ``major.minor`` for ``semantic-release`` version [skip ci] (\ `9d30df2 <https://github.com/saltstack-formulas/salt-formula/commit/9d30df2f5f7405b9e354203f22a524b79a44ac15>`_\ )

Tests
^^^^^


* **pkgs_spec:** update ``centos-8`` for ``2019.2.3`` release (\ `7121d1d <https://github.com/saltstack-formulas/salt-formula/commit/7121d1d8cd67230a9f9dabecd1a6e11a14cfa109>`_\ )
* **versions:** bump salt pkg versions (\ `c42125c <https://github.com/saltstack-formulas/salt-formula/commit/c42125c2ab1563b64e4768cf80955401a40a86ea>`_\ )

`1.1.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.0.0...v1.1.0>`_ (2019-12-19)
------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **formulas:** git.latest parallelization (\ `eda88bd <https://github.com/saltstack-formulas/salt-formula/commit/eda88bd1a684c8d462e12db31fb29cbccdf67a3d>`_\ )

`1.0.0 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.9...v1.0.0>`_ (2019-12-16)
-------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile:** restrict ``train`` gem version until upstream fix [skip ci] (\ `fdc60ae <https://github.com/saltstack-formulas/salt-formula/commit/fdc60aed86c4b5d016aff0745584d89f614208fc>`_\ )

Features
^^^^^^^^


* **per-formula-opts:** configure git.latest state per formula (\ `82c840d <https://github.com/saltstack-formulas/salt-formula/commit/82c840d6f96f69223c0df4b8463a072613a9d2df>`_\ )
* **per-formula-opts:** configure git.latest state per formula (\ `9362277 <https://github.com/saltstack-formulas/salt-formula/commit/9362277f2a61762b818dc775b30f15f93733efd5>`_\ )

BREAKING CHANGES
^^^^^^^^^^^^^^^^


* **per-formula-opts:** Potential adverse affect on running ``salt.formulas`` with multiple envs

`0.59.9 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.8...v0.59.9>`_ (2019-12-03)
---------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **pkgs_spec:** update for new ``opensuse`` package (\ `6da3d0d <https://github.com/saltstack-formulas/salt-formula/commit/6da3d0d9350bb6083f14073ee176fbd56fbad5ee>`_\ ), closes `/travis-ci.com/saltstack-formulas/salt-formula/jobs/261961203#L1619-L1632 <https://github.com//travis-ci.com/saltstack-formulas/salt-formula/jobs/261961203/issues/L1619-L1632>`_

`0.59.8 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.7...v0.59.8>`_ (2019-11-28)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **release.config.js:** use full commit hash in commit link [skip ci] (\ `67e1109 <https://github.com/saltstack-formulas/salt-formula/commit/67e110973b9ddde1ea07889e8e40de97e29c96db>`_\ )
* **shellcheck:** fix shellcheck error (\ `cc31514 <https://github.com/saltstack-formulas/salt-formula/commit/cc3151436cecc921c992c6b520ad951bbd0f867f>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **travis:** apply changes from build config validation [skip ci] (\ `56c2eb5 <https://github.com/saltstack-formulas/salt-formula/commit/56c2eb536709ff4b07413656b08a502954e15f97>`_\ )
* **travis:** opt-in to ``dpl v2`` to complete build config validation [skip ci] (\ `33f69cf <https://github.com/saltstack-formulas/salt-formula/commit/33f69cfb7bd462230547d2cbe91474aeccb91975>`_\ )
* **travis:** quote pathspecs used with ``git ls-files`` [skip ci] (\ `1a27b0a <https://github.com/saltstack-formulas/salt-formula/commit/1a27b0ae84a7433120fd82a644d7bfd02da18a40>`_\ )
* **travis:** run ``shellcheck`` during lint job [skip ci] (\ `f4e8ae6 <https://github.com/saltstack-formulas/salt-formula/commit/f4e8ae6871d9788f4b57fabd6e5962a44bf6982c>`_\ )
* **travis:** use build config validation (beta) [skip ci] (\ `85593f5 <https://github.com/saltstack-formulas/salt-formula/commit/85593f555e95928cfd0bafdc01ca4445baddd194>`_\ )

Performance Improvements
^^^^^^^^^^^^^^^^^^^^^^^^


* **travis:** improve ``salt-lint`` invocation [skip ci] (\ `ef7e1c1 <https://github.com/saltstack-formulas/salt-formula/commit/ef7e1c1e7b8eb97fcb859a85d919d78f553f82ed>`_\ )

`0.59.7 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.6...v0.59.7>`_ (2019-10-29)
---------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** upgrade matrix after ``2019.2.2`` release (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/b6e3a83>`_\ )
* **travis:** update ``salt-lint`` config for ``v0.0.10`` [skip ci] (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/4cbf0b2>`_\ )

Documentation
^^^^^^^^^^^^^


* **contributing:** remove to use org-level file instead [skip ci] (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/78d0fee>`_\ )
* **readme:** update link to ``CONTRIBUTING`` [skip ci] (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/924817b>`_\ )

Tests
^^^^^


* **pkgs_spec:** update for ``2019.2.2`` release (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/acbc238>`_\ )

`0.59.6 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.5...v0.59.6>`_ (2019-10-11)
---------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **pkgs_spec:** reset version from ``2019.2.1`` back to ``2019.2.0`` (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/4787ce7>`_\ )

`0.59.5 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.4...v0.59.5>`_ (2019-10-11)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **rubocop:** add fixes using ``rubocop --safe-auto-correct`` (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/62f82a4>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/64c6ba9>`_\ )
* **travis:** merge ``rubocop`` linter into main ``lint`` job (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/4ea85e8>`_\ )

`0.59.4 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.3...v0.59.4>`_ (2019-10-10)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **map.jinja:** fix ``salt-lint`` errors (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/5b348eb>`_\ )
* **minion.sls:** fix ``salt-lint`` errors (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/3e63977>`_\ )
* **syndic.sls:** fix ``salt-lint`` errors (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/ef4ad1e>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** install required packages to bootstrapped ``opensuse`` [skip ci] (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/8cc5952>`_\ )
* **kitchen:** use bootstrapped ``opensuse`` images until ``2019.2.2`` [skip ci] (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/0c5eb7e>`_\ )
* **platform:** add ``arch-base-latest`` (commented out for now) [skip ci] (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/8f36788>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ ` <https://github.com/saltstack-formulas/salt-formula/commit/e815eaa>`_\ )

`0.59.3 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.2...v0.59.3>`_ (2019-09-25)
---------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** change ``log_level`` to ``debug`` instead of ``info`` (\ `073175d <https://github.com/saltstack-formulas/salt-formula/commit/073175d>`_\ )

Tests
^^^^^


* **pkgs_spec:** update for ``2019.2.1`` release (\ `1bf9689 <https://github.com/saltstack-formulas/salt-formula/commit/1bf9689>`_\ )

`0.59.2 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.1...v0.59.2>`_ (2019-09-20)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **symlinks:** replace symlinks with real files (\ `c4d0132 <https://github.com/saltstack-formulas/salt-formula/commit/c4d0132>`_\ )

`0.59.1 <https://github.com/saltstack-formulas/salt-formula/compare/v0.59.0...v0.59.1>`_ (2019-09-20)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **pkgrepo:** fix settings for ``opensuse`` (\ `f00c9a7 <https://github.com/saltstack-formulas/salt-formula/commit/f00c9a7>`_\ )
* **pkgrepo:** provide settings for ``amazon`` (\ `cb726af <https://github.com/saltstack-formulas/salt-formula/commit/cb726af>`_\ )

Code Refactoring
^^^^^^^^^^^^^^^^


* **kitchen+travis+inspec:** use pre-salted images (\ `fc1d0b1 <https://github.com/saltstack-formulas/salt-formula/commit/fc1d0b1>`_\ )

`0.59.0 <https://github.com/saltstack-formulas/salt-formula/compare/v0.58.4...v0.59.0>`_ (2019-09-17)
---------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* use ``semantic-release`` cross-formula standard structure (\ `ebfeba2 <https://github.com/saltstack-formulas/salt-formula/commit/ebfeba2>`_\ )

`0.58.4 <https://github.com/saltstack-formulas/salt-formula/compare/v0.58.3...v0.58.4>`_ (2019-08-25)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **minion:** fix version compare in minion.sls (\ `49bf81b <https://github.com/saltstack-formulas/salt-formula/commit/49bf81b>`_\ )

`0.58.3 <https://github.com/saltstack-formulas/salt-formula/compare/v0.58.2...v0.58.3>`_ (2019-08-02)
---------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* **linux:** align to template-formula (plus fixes) (\ `71b4d8a <https://github.com/saltstack-formulas/salt-formula/commit/71b4d8a>`_\ )

`0.58.2 <https://github.com/saltstack-formulas/salt-formula/compare/v0.58.1...v0.58.2>`_ (2019-08-01)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **macos:** fix minion package handling for homebrew (\ `14276e2 <https://github.com/saltstack-formulas/salt-formula/commit/14276e2>`_\ )
* **minion:** fix jinja rendering error (\ `550f81b <https://github.com/saltstack-formulas/salt-formula/commit/550f81b>`_\ )
* **os:** pass state on unsupported os (\ `4557976 <https://github.com/saltstack-formulas/salt-formula/commit/4557976>`_\ )
* **perms:** some os have custom user/root (\ `beb0e85 <https://github.com/saltstack-formulas/salt-formula/commit/beb0e85>`_\ )

`0.58.1 <https://github.com/saltstack-formulas/salt-formula/compare/v0.58.0...v0.58.1>`_ (2019-08-01)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **travis:** disable two failing platforms until they can be fixed (\ `5fcadcd <https://github.com/saltstack-formulas/salt-formula/commit/5fcadcd>`_\ )

`0.58.0 <https://github.com/saltstack-formulas/salt-formula/compare/v0.57.1...v0.58.0>`_ (2019-06-13)
---------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **\ ``tofs``\ :** allow TOFS for master configuration (\ `1b202af <https://github.com/saltstack-formulas/salt-formula/commit/1b202af>`_\ )
* **\ ``tofs``\ :** allow TOFS for minion configuration (\ `fbe814a <https://github.com/saltstack-formulas/salt-formula/commit/fbe814a>`_\ )

`0.57.1 <https://github.com/saltstack-formulas/salt-formula/compare/v0.57.0...v0.57.1>`_ (2019-05-14)
---------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **semantic-release:** implement an automated changelog (\ `b73af20 <https://github.com/saltstack-formulas/salt-formula/commit/b73af20>`_\ )
