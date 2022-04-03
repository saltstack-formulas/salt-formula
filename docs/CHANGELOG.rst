
Changelog
=========

`1.10.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.10.1...v1.10.2>`_ (2022-04-03)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **gentoo:** use ``retry_options`` to avoid spurious service failures (\ `d00c069 <https://github.com/saltstack-formulas/salt-formula/commit/d00c069e25463e6e675b0cea9f625a6e78985744>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+gitlab:** update for new pre-salted images [skip ci] (\ `92a82a9 <https://github.com/saltstack-formulas/salt-formula/commit/92a82a98c72e5297caf08e1e135b72d09c2e4149>`_\ )
* update linters to latest versions [skip ci] (\ `47efbc0 <https://github.com/saltstack-formulas/salt-formula/commit/47efbc04920a3f20ef9a69350b1ee46bbee11b37>`_\ )

Tests
^^^^^


* **_mapdata:** add/update verification files for Fedora & Gentoo (\ `e9cb3d2 <https://github.com/saltstack-formulas/salt-formula/commit/e9cb3d27284d81115bac16c3af225c4b25eebaf9>`_\ )
* **system:** add ``build_platform_codename`` [skip ci] (\ `6b5598a <https://github.com/saltstack-formulas/salt-formula/commit/6b5598a8d8d91ccc367283f80d5c736c7eb0168c>`_\ )

`1.10.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.10.0...v1.10.1>`_ (2022-02-03)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **minion:** respect ``minion_remove_config: true`` (\ `02c31df <https://github.com/saltstack-formulas/salt-formula/commit/02c31df0c5cca2863a46fd3c517a6610bb331548>`_\ ), closes `#527 <https://github.com/saltstack-formulas/salt-formula/issues/527>`_

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile:** allow rubygems proxy to be provided as an env var [skip ci] (\ `46fc639 <https://github.com/saltstack-formulas/salt-formula/commit/46fc639d46bedfe0489ed66719534384fcc84757>`_\ )
* **kitchen+gitlab:** update for new pre-salted images [skip ci] (\ `d95dac2 <https://github.com/saltstack-formulas/salt-formula/commit/d95dac24aadd343bf92a976a59e0a72be6ade2d8>`_\ )
* **windows:** update Salt version installed to ``3004-3`` [skip ci] (\ `fdccb9b <https://github.com/saltstack-formulas/salt-formula/commit/fdccb9b6125acbc90d1a596553eced7525af4a47>`_\ )
* **windows:** use Salt version ``3004`` [skip ci] (\ `a1e9823 <https://github.com/saltstack-formulas/salt-formula/commit/a1e9823b42205f1442d3bea2037936b64760a8b6>`_\ )

Tests
^^^^^


* update for new pre-salted images [skip ci] (\ `8015fe0 <https://github.com/saltstack-formulas/salt-formula/commit/8015fe0c9252d80c8c63aa08a1a0152e0eba279b>`_\ )

`1.10.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.10...v1.10.0>`_ (2021-12-27)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **log_fmt_console:** double option in config (\ `b705e44 <https://github.com/saltstack-formulas/salt-formula/commit/b705e44378dc8905e4394362c55cd757afb88be7>`_\ )
* **minion:** fix windows path construction (\ `c9c6e12 <https://github.com/saltstack-formulas/salt-formula/commit/c9c6e1222396ef3105c19bb7d4e9e8f1670fd700>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **proxy:** replace deprecated Windows ``2016`` with ``2022`` [skip ci] (\ `21b8d36 <https://github.com/saltstack-formulas/salt-formula/commit/21b8d3626e4f356b43cac8098f5f9be334840818>`_\ )
* **proxy+windows:** fix setting up WinRM [skip ci] (\ `39cbc1b <https://github.com/saltstack-formulas/salt-formula/commit/39cbc1b91bfe5c46664ca2a74233b62f99ac3850>`_\ )
* **vagrant:** replace FreeBSD 12.2 with 12.3 [skip ci] (\ `1654e67 <https://github.com/saltstack-formulas/salt-formula/commit/1654e6746b4e0c18d2a88fa2afe678f6f5bb5238>`_\ )

Features
^^^^^^^^


* **minion:** ensure correct permissions for salt-cloud generated files (\ `dfa7f7d <https://github.com/saltstack-formulas/salt-formula/commit/dfa7f7d1d8fd02c928a71415b49c408446e09423>`_\ )

`1.9.10 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.9...v1.9.10>`_ (2021-12-19)
--------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **minion:** update config parameter saltenv (\ `7540dc9 <https://github.com/saltstack-formulas/salt-formula/commit/7540dc90aa32976640a298db16c0219173994e4a>`_\ )

`1.9.9 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.8...v1.9.9>`_ (2021-12-04)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* sort extra options in configuration (\ `89cdcec <https://github.com/saltstack-formulas/salt-formula/commit/89cdcec5953550e1fe5a8a1e0974c9b31e736d1f>`_\ )

`1.9.8 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.7...v1.9.8>`_ (2021-11-30)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **master:** master.d template to support saltclass ext_pillar (\ `5b7d7ea <https://github.com/saltstack-formulas/salt-formula/commit/5b7d7ea70e19a9c27b5de96eb0752db4534bc62d>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+ci:** update with ``3004`` pre-salted images/boxes [skip ci] (\ `47d6c23 <https://github.com/saltstack-formulas/salt-formula/commit/47d6c23df345c037e650b0b92db028b010708dc8>`_\ )

Tests
^^^^^


* **_mapdata:** add verification file for OpenBSD 7.0 [skip ci] (\ `f1ead04 <https://github.com/saltstack-formulas/salt-formula/commit/f1ead04517a7fd369ac9fb90cb6b8f88dda31899>`_\ )
* **_mapdata:** update verification files for FreeBSD [skip ci] (\ `4b356b1 <https://github.com/saltstack-formulas/salt-formula/commit/4b356b12134dbdf2ee6828c34edddaefbac50cd9>`_\ )

`1.9.7 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.6...v1.9.7>`_ (2021-11-22)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+gitlab:** adjust matrix to add ``3004`` (\ `93289f6 <https://github.com/saltstack-formulas/salt-formula/commit/93289f6df12a675eafcf719ced7363e350b9651b>`_\ )

Tests
^^^^^


* **silicon:** add pillar and verification files for ``3004`` (\ `f9ff8ea <https://github.com/saltstack-formulas/salt-formula/commit/f9ff8eab10fe22d6930107cefef4a589b85e81d0>`_\ )

`1.9.6 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.5...v1.9.6>`_ (2021-11-17)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* use ``pillars_from_directories`` & ``test/salt/pillar/top.sls`` (\ `98c9dbf <https://github.com/saltstack-formulas/salt-formula/commit/98c9dbfcfbb45f514a7d35165f1ac572c0bfe6af>`_\ )

Tests
^^^^^


* **pillar:** centralise and clean-up entries (\ `db5b69c <https://github.com/saltstack-formulas/salt-formula/commit/db5b69c9cda824194a891c515f19baabe46748b6>`_\ )
* centralise all suites into ``default`` suite (\ `b475e24 <https://github.com/saltstack-formulas/salt-formula/commit/b475e24638edc7e6cbd5b131b3d1316727bf8246>`_\ )

`1.9.5 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.4...v1.9.5>`_ (2021-11-05)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* make it possible to not have key_url set (\ `97e1d1f <https://github.com/saltstack-formulas/salt-formula/commit/97e1d1f07a2acc8e9b048412911d61695d7187b3>`_\ ), closes `#520 <https://github.com/saltstack-formulas/salt-formula/issues/520>`_
* update to modern defaults for Debian family (\ `a932a8c <https://github.com/saltstack-formulas/salt-formula/commit/a932a8cc84d6a97d958aa0d6e6b1026bbbf5a745>`_\ )

`1.9.4 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.3...v1.9.4>`_ (2021-10-27)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **master:** don't manage config for saltstack enterprise master plugin (\ `184f338 <https://github.com/saltstack-formulas/salt-formula/commit/184f338741c42457e5823c5a9eccecf24cbc1b34>`_\ )

`1.9.3 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.2...v1.9.3>`_ (2021-10-05)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+ci:** update with latest CVE pre-salted images (\ `1a8512d <https://github.com/saltstack-formulas/salt-formula/commit/1a8512d77f8212cd51aa7ba09625f647adc5e171>`_\ )

Tests
^^^^^


* **_mapdata:** reset indentation [skip ci] (\ `678548f <https://github.com/saltstack-formulas/salt-formula/commit/678548fc8ba4bb8fe2c791665b8dda3abca327ee>`_\ )
* **_mapdata:** use ``15.3`` for ``opensuse-15.yaml`` (\ `f4a91c4 <https://github.com/saltstack-formulas/salt-formula/commit/f4a91c458cca5b609ec1fc32cd100c147e1894b2>`_\ )
* **neon:** remove pillar and tests for ``v3000`` (\ `d00b04a <https://github.com/saltstack-formulas/salt-formula/commit/d00b04a5df4a24ba49a4f8fa7028f5e02503aac8>`_\ )

`1.9.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.1...v1.9.2>`_ (2021-09-17)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **debian,ubuntu:** rename repo file to match documentation (\ `47ab261 <https://github.com/saltstack-formulas/salt-formula/commit/47ab261b397da51febffaefef848dfeff9b57c27>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **mapdata:** remove Ubuntu 16.04 [skip ci] (\ `cd2a0bf <https://github.com/saltstack-formulas/salt-formula/commit/cd2a0bfdf00aa196d11b2a06f5ecd2023a1cb469>`_\ )

`1.9.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.9.0...v1.9.1>`_ (2021-09-04)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **default:** set salt:minion:master_type to str (\ `ca1df1b <https://github.com/saltstack-formulas/salt-formula/commit/ca1df1b69e9b9c2caef8a1e2a18a6a68a6cdf524>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **freebsd:** update with latest pre-salted Vagrant boxes [skip ci] (\ `0231e63 <https://github.com/saltstack-formulas/salt-formula/commit/0231e6368e38e8c2d3a8ddf3c8a45728f19184ac>`_\ )
* **gemfile+lock:** use ``ssf`` customised ``inspec`` repo [skip ci] (\ `a86e19e <https://github.com/saltstack-formulas/salt-formula/commit/a86e19e794d7bb9f634818c3fe36352b3207187a>`_\ )
* **kitchen:** move ``provisioner`` block & update ``run_command`` [skip ci] (\ `5cc8759 <https://github.com/saltstack-formulas/salt-formula/commit/5cc8759efd586b98dda3fc0cdf627d57bee7416b>`_\ )
* **kitchen+ci:** update with latest ``3003.2`` pre-salted images [skip ci] (\ `86b0fa1 <https://github.com/saltstack-formulas/salt-formula/commit/86b0fa1d406a2bcbef42f60e74b0941f16ed00d4>`_\ )
* **pillar:** update master_type in pillar.example (\ `8fa064b <https://github.com/saltstack-formulas/salt-formula/commit/8fa064baa911d7c5f5527be770a49264cf9c213c>`_\ )
* add Debian 11 Bullseye & update ``yamllint`` configuration [skip ci] (\ `ac1d3b9 <https://github.com/saltstack-formulas/salt-formula/commit/ac1d3b9a2de95d9e08577e308b08482875c61cd3>`_\ )

Tests
^^^^^


* **_mapdata:** add AlmaLinux verification file [skip ci] (\ `42d6487 <https://github.com/saltstack-formulas/salt-formula/commit/42d64870e33b68b1cc6bf920c876ac2edc7ef4f5>`_\ )
* **_mapdata:** update verification files for ``master_type: str`` (\ `c16e7a3 <https://github.com/saltstack-formulas/salt-formula/commit/c16e7a3b755e849fc91bea1aefd0d549a47882e5>`_\ )
* **pkgs_spec:** fix latest rubocop violations [skip ci] (\ `f64197a <https://github.com/saltstack-formulas/salt-formula/commit/f64197ada462dc7a1a9d6b436ccec4ff5f3aa42f>`_\ )

`1.9.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.8.5...v1.9.0>`_ (2021-07-14)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **3003.1:** update inc. AlmaLinux, Rocky & ``rst-lint`` [skip ci] (\ `0e62858 <https://github.com/saltstack-formulas/salt-formula/commit/0e628589866e9881407972c263494896bcacae45>`_\ )
* **kitchen.vagrant.yml:** disable FreeBSD until pre-salted boxes updated (\ `fa820c7 <https://github.com/saltstack-formulas/salt-formula/commit/fa820c78392e68f34c9dbb30021fb2ef3ba0f9c0>`_\ )
* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] (\ `226a187 <https://github.com/saltstack-formulas/salt-formula/commit/226a187258bb32eea66b77fac9cccf43f65e6ad5>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** add documentation regarding salt.formula usage [skip ci] (\ `209575f <https://github.com/saltstack-formulas/salt-formula/commit/209575f385ea352a36c00b60d3bf67b100f16f9d>`_\ )

Features
^^^^^^^^


* **freebsd:** update packages from ``py37-*`` => ``py38-*`` (\ `0ab42d7 <https://github.com/saltstack-formulas/salt-formula/commit/0ab42d7ce864ca39e628a962a589cb894606ad36>`_\ )

`1.8.5 <https://github.com/saltstack-formulas/salt-formula/compare/v1.8.4...v1.8.5>`_ (2021-05-25)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **oracle-7:** use ``osmajorrelease`` instead of ``$releasever`` (\ `5146c44 <https://github.com/saltstack-formulas/salt-formula/commit/5146c449d5d2d00ba4da67567d74966c21f394a8>`_\ )
* **repo:** update repo urls to ``repo.saltproject.io`` (\ `80542ba <https://github.com/saltstack-formulas/salt-formula/commit/80542bad6ea88c89da474703453226e4ed6c7072>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **vagrant:** add OpenBSD 6.9 [skip ci] (\ `374527b <https://github.com/saltstack-formulas/salt-formula/commit/374527b235993f5a3a8214e5a4bebcbd101d71a0>`_\ )
* add ``arch-master`` to matrix and update ``.travis.yml`` [skip ci] (\ `b867733 <https://github.com/saltstack-formulas/salt-formula/commit/b8677339cc5cdf0d2f9c840dae52336230980127>`_\ )
* **gitlab-ci:** update Fedora testing after release [skip ci] (\ `33d6a03 <https://github.com/saltstack-formulas/salt-formula/commit/33d6a033d38a3197c4dd8b719548d85a2fb7f734>`_\ )

`1.8.4 <https://github.com/saltstack-formulas/salt-formula/compare/v1.8.3...v1.8.4>`_ (2021-04-24)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **freebsd:** use ``retry_options`` to avoid spurious service failures (\ `698b7ea <https://github.com/saltstack-formulas/salt-formula/commit/698b7eae59e1585483fa26366f38bed12a835843>`_\ )

`1.8.3 <https://github.com/saltstack-formulas/salt-formula/compare/v1.8.2...v1.8.3>`_ (2021-04-22)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+gitlab:** adjust matrix to add ``3003`` (\ `480b7ed <https://github.com/saltstack-formulas/salt-formula/commit/480b7edbfbe58532df89eebc59f8b2b48922327c>`_\ )
* **vagrant:** add FreeBSD 13.0 [skip ci] (\ `6316991 <https://github.com/saltstack-formulas/salt-formula/commit/631699133424a456f1dfe829a717ea339f345af7>`_\ )
* **vagrant:** add Windows 10 pre-salted box [skip ci] (\ `fd285d8 <https://github.com/saltstack-formulas/salt-formula/commit/fd285d8c5bb0b266116f47b274ebe57ca849d662>`_\ )

Tests
^^^^^


* **aluminium:** add pillar, tests and verification files for ``3003`` (\ `752a1de <https://github.com/saltstack-formulas/salt-formula/commit/752a1dea22dfd722b5732882d108ea5ecbcd332f>`_\ )
* **freebsd:** add ``map.jinja`` verification file (for 13.0) (\ `10ae613 <https://github.com/saltstack-formulas/salt-formula/commit/10ae613cae58943c8af38a9199a0effcc5b7fba8>`_\ )

`1.8.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.8.1...v1.8.2>`_ (2021-04-09)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **freebsd:** fix package names [skip ci] (\ `a30f124 <https://github.com/saltstack-formulas/salt-formula/commit/a30f124485550e487d8bd41db0549b03bbeb2d48>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **vagrant:** use pre-salted boxes & conditional local settings [skip ci] (\ `5941618 <https://github.com/saltstack-formulas/salt-formula/commit/5941618c6e322961009ce2e0aa6412337a71e79d>`_\ )

Tests
^^^^^


* **freebsd-11:** fix ``osfinger`` in comment [skip ci] (\ `26f2cc1 <https://github.com/saltstack-formulas/salt-formula/commit/26f2cc1ef0a9c8d21b5767db877119eef7cf1515>`_\ )

`1.8.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.8.0...v1.8.1>`_ (2021-03-30)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **freebsd:** update to provide support for most recent versions (\ `24ebbb4 <https://github.com/saltstack-formulas/salt-formula/commit/24ebbb4e0c44a34fa3b20379306be67b5c03fbbe>`_\ )
* **openbsd:** update to provide support for most recent versions (\ `61201de <https://github.com/saltstack-formulas/salt-formula/commit/61201de8c65663498b6cb1b6f0f154a9af0e691f>`_\ )
* **osfamilymap:** use ``whoami`` for Windows ``rootuser`` (\ `69d5981 <https://github.com/saltstack-formulas/salt-formula/commit/69d598138e18134a9dcf8ed84daf04e3d4e2158e>`_\ ), closes `#495 <https://github.com/saltstack-formulas/salt-formula/issues/495>`_

Code Refactoring
^^^^^^^^^^^^^^^^


* **retry_options:** provide options from defaults/pillar (\ `bbd7286 <https://github.com/saltstack-formulas/salt-formula/commit/bbd7286240c2f604e9c1a6bb027e696fc973f74f>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* enable Vagrant-based testing using GitHub Actions (\ `163c77f <https://github.com/saltstack-formulas/salt-formula/commit/163c77fceea0f4a098bc74039cb24e77f0f9852a>`_\ )
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] (\ `cfefcc8 <https://github.com/saltstack-formulas/salt-formula/commit/cfefcc83c032ae76178d2c24169462b18a0434c7>`_\ )
* **windows:** use ``kitchen.windows.yml`` (\ `c6043fb <https://github.com/saltstack-formulas/salt-formula/commit/c6043fbc9dde691bb019088a0dfd37d048a16773>`_\ )

Documentation
^^^^^^^^^^^^^


* **readme:** add ``Testing with Vagrant`` section (\ `ef1bc02 <https://github.com/saltstack-formulas/salt-formula/commit/ef1bc02a8680a9b92b9d8d74013986070cc01f5e>`_\ )

Tests
^^^^^


* update for new platforms (inc. using ``system`` library) (\ `e6bcdc1 <https://github.com/saltstack-formulas/salt-formula/commit/e6bcdc1b4d8d15f00af17d1c33ed57f496d951b2>`_\ )
* **_mapdata:** add Arch Linux verification file (\ `e31a56e <https://github.com/saltstack-formulas/salt-formula/commit/e31a56e7a328117f5d5b951119eb853a91eade60>`_\ )
* add Windows map verification files (\ `e0afe89 <https://github.com/saltstack-formulas/salt-formula/commit/e0afe89f2492f1b530d6205b871e435ea7ab0c97>`_\ )
* standardise use of ``share`` suite & ``_mapdata`` state [skip ci] (\ `9816f47 <https://github.com/saltstack-formulas/salt-formula/commit/9816f473c5aae19ddf25a5c9b126221694c61c6c>`_\ )

`1.8.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.7.5...v1.8.0>`_ (2021-03-03)
------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* allow selecting alternate salt package repositories (\ `8742ab3 <https://github.com/saltstack-formulas/salt-formula/commit/8742ab30bb951cb28b3b527693aab9f6439b76f6>`_\ )

Tests
^^^^^


* **debian+ubuntu:** update ``pkgrepo`` to use ``https`` instead of ``http`` (\ `e94a8c9 <https://github.com/saltstack-formulas/salt-formula/commit/e94a8c9dcec9c1643d655859de58eebb5d1eab81>`_\ )

`1.7.5 <https://github.com/saltstack-formulas/salt-formula/compare/v1.7.4...v1.7.5>`_ (2021-03-02)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* revert to using ``is mapping`` in Jinja2 (\ `a89fb3f <https://github.com/saltstack-formulas/salt-formula/commit/a89fb3f4aa819ae4767a7818018d292e2b6633df>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile+lock:** use ``ssf`` customised ``kitchen-docker`` repo [skip ci] (\ `25fea89 <https://github.com/saltstack-formulas/salt-formula/commit/25fea89238d0fc453af9679cb364bcdcc2c7f1e0>`_\ )
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] (\ `fb9901e <https://github.com/saltstack-formulas/salt-formula/commit/fb9901e3acd334fc91f21abab4089a53977f6061>`_\ )
* **pre-commit:** update hook for ``rubocop`` [skip ci] (\ `a874a76 <https://github.com/saltstack-formulas/salt-formula/commit/a874a76967b30426ec8ff9ccae8cb3801682cbcb>`_\ )

`1.7.4 <https://github.com/saltstack-formulas/salt-formula/compare/v1.7.3...v1.7.4>`_ (2021-01-29)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **osfamilymap:** update openSUSE ``pkgrepo`` URLs (\ `48f8da0 <https://github.com/saltstack-formulas/salt-formula/commit/48f8da03574d85b27ef9692eb631b893ee047525>`_\ )
* **pkgrepo/suse/install:** avoid managing repo if it already exists (\ `d5320a3 <https://github.com/saltstack-formulas/salt-formula/commit/d5320a35edfbaa44c769bf73036b1bee7581cab5>`_\ ), closes `/github.com/saltstack/salt/blob/45cc49daed1618dbe89e1f012128c8dcab00b356/salt/modules/zypperpkg.py#L1262-L1265 <https://github.com//github.com/saltstack/salt/blob/45cc49daed1618dbe89e1f012128c8dcab00b356/salt/modules/zypperpkg.py/issues/L1262-L1265>`_

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+gitlab:** update for new pre-salted images (\ `a9413e8 <https://github.com/saltstack-formulas/salt-formula/commit/a9413e8c29ba456cd1cbb58b5b028c77d707cf30>`_\ )

Tests
^^^^^


* **tumbleweed:** add map verification files (\ `6aeaa5a <https://github.com/saltstack-formulas/salt-formula/commit/6aeaa5ac941e0845c5af1f247100e52e354d545c>`_\ )

`1.7.3 <https://github.com/saltstack-formulas/salt-formula/compare/v1.7.2...v1.7.3>`_ (2020-12-23)
------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **_mapdata:** generate verification files (\ `da6d150 <https://github.com/saltstack-formulas/salt-formula/commit/da6d1509fd12029edaf907f887071e3604aa0a0a>`_\ )
* **map:** verify ``map.jinja`` dump using ``_mapdata`` state (\ `d2404d5 <https://github.com/saltstack-formulas/salt-formula/commit/d2404d5175bdc01f532032c82a4891e2f5d070cc>`_\ )

`1.7.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.7.1...v1.7.2>`_ (2020-12-20)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **commitlint:** ensure ``upstream/master`` uses main repo URL [skip ci] (\ `2a5b679 <https://github.com/saltstack-formulas/salt-formula/commit/2a5b6798d4a0c31f74d849f3f9df13a9cf29b9da>`_\ )
* **gitlab-ci:** add ``rubocop`` linter (with ``allow_failure``\ ) [skip ci] (\ `8417653 <https://github.com/saltstack-formulas/salt-formula/commit/8417653525c62e30493b2788e0c9ab6224ffe4af>`_\ )
* **kitchen+gitlab:** adjust matrix to add ``3002`` (\ `7df2445 <https://github.com/saltstack-formulas/salt-formula/commit/7df24454812c6bbd48a9c07c877efba4df194852>`_\ )

Tests
^^^^^


* **magnesium:** add pillar and tests for ``3002`` (\ `c066060 <https://github.com/saltstack-formulas/salt-formula/commit/c0660608d7780483f0c1ebdd57b0873c3d62cb56>`_\ )

`1.7.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.7.0...v1.7.1>`_ (2020-12-16)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gitlab-ci:** use GitLab CI as Travis CI replacement (\ `c9b2cb4 <https://github.com/saltstack-formulas/salt-formula/commit/c9b2cb4a4a3562b80c84450284fdfa818d3620bc>`_\ )

Tests
^^^^^


* **fluorine:** remove pillar and tests for ``2019.2`` (\ `75ccf59 <https://github.com/saltstack-formulas/salt-formula/commit/75ccf591eb20567464a306616e13c5d473af0b4e>`_\ )
* **pkgs_spec:** test for major version only (i.e. ``3000``\ ) (\ `618f95a <https://github.com/saltstack-formulas/salt-formula/commit/618f95a6653adab4c7121cddd13ea2d128b337a4>`_\ )

`1.7.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.6.0...v1.7.0>`_ (2020-10-12)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **pre-commit:** add to formula [skip ci] (\ `7ff962e <https://github.com/saltstack-formulas/salt-formula/commit/7ff962e2addd97e84dd99c87351b1412f64134af>`_\ )
* **pre-commit:** enable/disable ``rstcheck`` as relevant [skip ci] (\ `426b29c <https://github.com/saltstack-formulas/salt-formula/commit/426b29c21149f5cef9064177177891a091c6bb82>`_\ )
* **pre-commit:** finalise ``rstcheck`` configuration [skip ci] (\ `22fa616 <https://github.com/saltstack-formulas/salt-formula/commit/22fa616f59864a77e3f7ea5b17e8a7f0bcf415be>`_\ )

Features
^^^^^^^^


* add Gentoo support (\ `127c5d7 <https://github.com/saltstack-formulas/salt-formula/commit/127c5d779b1e2b9beb7322a2d03a027c50e5c6d7>`_\ )

`1.6.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.5.2...v1.6.0>`_ (2020-09-20)
------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* enable the metadata grains server by default (\ `b1d296d <https://github.com/saltstack-formulas/salt-formula/commit/b1d296d270d3cc06332f569f81ee95fc78d95596>`_\ )

`1.5.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.5.1...v1.5.2>`_ (2020-09-20)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **jinja:** stop repeating user/group args (\ `e313401 <https://github.com/saltstack-formulas/salt-formula/commit/e313401cd657a77a3624ed372c8e22e905c2d172>`_\ )
* **windows:** dont run master state (\ `a36f2eb <https://github.com/saltstack-formulas/salt-formula/commit/a36f2eb2d2ab4e3d57885177f3438037b15318e3>`_\ )
* **windows:** git.latest(parallel:true) does not work (\ `0c591bb <https://github.com/saltstack-formulas/salt-formula/commit/0c591bba95cebd341e73cdd0fc986428ee34ce7e>`_\ )
* **windows:** group arg not supported on windows (\ `d61e671 <https://github.com/saltstack-formulas/salt-formula/commit/d61e671fa0de58fe60c5c0cdc23d55c49b93dd01>`_\ )
* **windows:** group name is users not root (\ `887d155 <https://github.com/saltstack-formulas/salt-formula/commit/887d1559b5496dd07e730390f4309568d0428c2f>`_\ )

`1.5.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.5.0...v1.5.1>`_ (2020-08-25)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **service:** service salt-master and salt-minion to restart last (\ `d71cf0c <https://github.com/saltstack-formulas/salt-formula/commit/d71cf0c4f9ba716b93b784993f0409337e60fa18>`_\ )
* **service:** svc ``salt-master`` watch ``remove-default-master-conf-file`` (\ `e1774e3 <https://github.com/saltstack-formulas/salt-formula/commit/e1774e3b40c54b554552ecf34508c1bcbf5ffbd1>`_\ )

Styles
^^^^^^


* **libtofs.jinja:** use Black-inspired Jinja formatting [skip ci] (\ `76e820c <https://github.com/saltstack-formulas/salt-formula/commit/76e820c36f6f0ea712001285dd79cbd5b54489e8>`_\ )

`1.5.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.4.6...v1.5.0>`_ (2020-07-15)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **macos:** use macos service names (\ `c72b183 <https://github.com/saltstack-formulas/salt-formula/commit/c72b183f5ff885b30f0ac0fff8c9a847333a9304>`_\ )
* **minion:** fix requisites from recent prs (\ `a466456 <https://github.com/saltstack-formulas/salt-formula/commit/a46645607b3e20cf2f69a51e976457c201830c4c>`_\ )

Features
^^^^^^^^


* **macos:** basic launchctl service support (\ `94027f7 <https://github.com/saltstack-formulas/salt-formula/commit/94027f7332093764553162d9e80074029647f7ef>`_\ )

Tests
^^^^^


* **versions:** bump pkg versions (\ `37eb3b3 <https://github.com/saltstack-formulas/salt-formula/commit/37eb3b35141885fe16ddc59d0ba45b29dbd5babe>`_\ )

`1.4.6 <https://github.com/saltstack-formulas/salt-formula/compare/v1.4.5...v1.4.6>`_ (2020-07-01)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **freebsd:** command ``at`` is already present in base system (\ `b6ab1b1 <https://github.com/saltstack-formulas/salt-formula/commit/b6ab1b1d543908ea050cdb928a255dd4e2a3384d>`_\ )

`1.4.5 <https://github.com/saltstack-formulas/salt-formula/compare/v1.4.4...v1.4.5>`_ (2020-06-28)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **windows:** ``py2`` should still be default like other platforms (\ `62f6d39 <https://github.com/saltstack-formulas/salt-formula/commit/62f6d39d63cc2e5c134571e20518f7da8c17e09e>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **github:** add Windows testing using Actions (\ `1eca9c7 <https://github.com/saltstack-formulas/salt-formula/commit/1eca9c75519d9ad97dc6526fa83a56477da16579>`_\ )

Tests
^^^^^


* **windows:** add local testing of Windows using Vagrant/Virtualbox (\ `0465af7 <https://github.com/saltstack-formulas/salt-formula/commit/0465af72dac6d8609f918ce32796c91157422358>`_\ )

`1.4.4 <https://github.com/saltstack-formulas/salt-formula/compare/v1.4.3...v1.4.4>`_ (2020-06-23)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen:** use ``saltimages`` Docker Hub where available [skip ci] (\ `f66a09c <https://github.com/saltstack-formulas/salt-formula/commit/f66a09c2d69bf676113be9073cd365860e8548a3>`_\ )
* **kitchen+travis:** adjust matrix to add ``3001`` (\ `9060879 <https://github.com/saltstack-formulas/salt-formula/commit/90608799249147f8c0d9e3189b865d8999dc4e5f>`_\ )

Tests
^^^^^


* **sodium:** add pillar and tests for ``3001`` (\ `42cacc2 <https://github.com/saltstack-formulas/salt-formula/commit/42cacc253f9f0fbf1411ac19f9dc4169aef5d3f5>`_\ )

`1.4.3 <https://github.com/saltstack-formulas/salt-formula/compare/v1.4.2...v1.4.3>`_ (2020-06-01)
------------------------------------------------------------------------------------------------------

Tests
^^^^^


* **pkgs_spec:** simplify using ``match`` (trigger: update for ``suse``\ ) (\ `b2b1fee <https://github.com/saltstack-formulas/salt-formula/commit/b2b1fee370060c82101526157dc2630a4453dfb8>`_\ ), closes `/travis-ci.org/github/myii/salt-formula/jobs/692337807#L2366-L2381 <https://github.com//travis-ci.org/github/myii/salt-formula/jobs/692337807/issues/L2366-L2381>`_

`1.4.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.4.1...v1.4.2>`_ (2020-05-26)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **opensuse:** use appropriate upstream repo (\ `5d9a92b <https://github.com/saltstack-formulas/salt-formula/commit/5d9a92bf1d567cf25916239c2b11828fe625fd17>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** adjust matrix to add ``3000.3`` [skip ci] (\ `a333801 <https://github.com/saltstack-formulas/salt-formula/commit/a3338018fbf0f770c41a6523473eb42123daa435>`_\ )
* **kitchen+travis:** adjust matrix to add ``opensuse-leap-15.2`` (\ `7fc32fb <https://github.com/saltstack-formulas/salt-formula/commit/7fc32fb0fb739a713c58d1642cd206106270322e>`_\ )
* **kitchen+travis:** adjust matrix to add ``opensuse-leap-15.2`` (\ `1afa84e <https://github.com/saltstack-formulas/salt-formula/commit/1afa84e1af2132763b6dbdaff98892dd35bf9f1c>`_\ )
* **travis:** add notifications => zulip [skip ci] (\ `7e2a9c0 <https://github.com/saltstack-formulas/salt-formula/commit/7e2a9c0acd8dff358cfb80a14eaa596e3abf3e60>`_\ )
* **workflows/commitlint:** add to repo [skip ci] (\ `38ebe56 <https://github.com/saltstack-formulas/salt-formula/commit/38ebe5653b72fb5b9e11fdeef9c8f394600bd2ff>`_\ )

Tests
^^^^^


* **pkgs_spec:** update for releases ``3000.3`` & ``2019.2.5`` (\ `5917569 <https://github.com/saltstack-formulas/salt-formula/commit/591756946403d17228a59b46ab48f6d1985743e2>`_\ )
* **pkgs_spec:** update version installed on ``fedora`` (\ `301a988 <https://github.com/saltstack-formulas/salt-formula/commit/301a9884ac0159ead8324b6ab4eaa170943b92f8>`_\ )

`1.4.1 <https://github.com/saltstack-formulas/salt-formula/compare/v1.4.0...v1.4.1>`_ (2020-05-02)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile.lock:** add to repo with updated ``Gemfile`` [skip ci] (\ `f10a85f <https://github.com/saltstack-formulas/salt-formula/commit/f10a85fc706aeba06453234b02bb5d8b0f00ad34>`_\ )
* **kitchen+travis:** adjust matrix to add ``3000.2`` & remove ``2018.3`` (\ `433a2c1 <https://github.com/saltstack-formulas/salt-formula/commit/433a2c1597fca67762cc41617d1a4056b6b6adc3>`_\ )

Tests
^^^^^


* add tests for ``v3000-py2`` (\ `c228029 <https://github.com/saltstack-formulas/salt-formula/commit/c228029879f36ee5aaa5f3cd3d3684ede29808bb>`_\ )
* **pkgs_spec:** update for CVE releases ``3000.2`` & ``2019.2.4`` (\ `965588b <https://github.com/saltstack-formulas/salt-formula/commit/965588b10808dea7dcf13fa651c95f61f2e4f83b>`_\ )
* remove deprecated Salt/Python versions (\ `7f19796 <https://github.com/saltstack-formulas/salt-formula/commit/7f19796517e920d0b1773b22724c68d5a8de681b>`_\ )

`1.4.0 <https://github.com/saltstack-formulas/salt-formula/compare/v1.3.4...v1.4.0>`_ (2020-04-18)
------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **package:** use apt-pinning to pin specific package version (\ `98ad87a <https://github.com/saltstack-formulas/salt-formula/commit/98ad87a0014114f79fde1854dfb3731fad772ac4>`_\ )

Tests
^^^^^


* **pkgs_spec:** update ``fedora`` version [skip ci] (\ `e786eb6 <https://github.com/saltstack-formulas/salt-formula/commit/e786eb6b8e8e3892046f6d56e719e119b16591b7>`_\ )

`1.3.4 <https://github.com/saltstack-formulas/salt-formula/compare/v1.3.3...v1.3.4>`_ (2020-04-03)
------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **api:** remove spurious colon in salt.api state (\ `02fbcd4 <https://github.com/saltstack-formulas/salt-formula/commit/02fbcd43fc56e99fa62d7ab78658fa19e5d83372>`_\ )

`1.3.3 <https://github.com/saltstack-formulas/salt-formula/compare/v1.3.2...v1.3.3>`_ (2020-04-01)
------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** adjust matrix to update ``3000`` to ``3000.1`` (\ `a8fe65a <https://github.com/saltstack-formulas/salt-formula/commit/a8fe65a2c80a63cb167ea6f7f88b1198b6e07b97>`_\ )

Tests
^^^^^


* **pkgs_spec:** update ``3000`` to ``3000.1`` (\ `1e677cd <https://github.com/saltstack-formulas/salt-formula/commit/1e677cd761ab82ff6160d7b96ce7f6920b2e02e4>`_\ )
* **service_spec:** add ``should be_installed`` (\ `b5461a0 <https://github.com/saltstack-formulas/salt-formula/commit/b5461a0ebab63fb77186ea5960e71bd1426609a1>`_\ )

`1.3.2 <https://github.com/saltstack-formulas/salt-formula/compare/v1.3.1...v1.3.2>`_ (2020-03-21)
------------------------------------------------------------------------------------------------------

Code Refactoring
^^^^^^^^^^^^^^^^


* **osfamilymap:** remove workaround for OpenSUSE 15.1 (\ `0da366c <https://github.com/saltstack-formulas/salt-formula/commit/0da366c7b25778dcec12f2a4a80cd4072c3d4d29>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** adjust matrix to add ``3000`` & remove ``2017.7`` (\ `4a5f805 <https://github.com/saltstack-formulas/salt-formula/commit/4a5f8053e938569814a2043405416c74b8c990fd>`_\ )

Tests
^^^^^


* **neon:** add pillar and tests for ``3000`` (\ `f91f10c <https://github.com/saltstack-formulas/salt-formula/commit/f91f10c2800edfc1b59fd731a6b6f82a47f74fcc>`_\ )
* **nitrogen:** remove pillar and tests for ``2017.7`` (\ `f246a5e <https://github.com/saltstack-formulas/salt-formula/commit/f246a5e0af84f527df2f87428d929440c716361b>`_\ )

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
