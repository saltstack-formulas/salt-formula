# Changelog

## [1.7.1](https://github.com/saltstack-formulas/salt-formula/compare/v1.7.0...v1.7.1) (2020-12-16)


### Continuous Integration

* **gitlab-ci:** use GitLab CI as Travis CI replacement ([c9b2cb4](https://github.com/saltstack-formulas/salt-formula/commit/c9b2cb4a4a3562b80c84450284fdfa818d3620bc))


### Tests

* **fluorine:** remove pillar and tests for `2019.2` ([75ccf59](https://github.com/saltstack-formulas/salt-formula/commit/75ccf591eb20567464a306616e13c5d473af0b4e))
* **pkgs_spec:** test for major version only (i.e. `3000`) ([618f95a](https://github.com/saltstack-formulas/salt-formula/commit/618f95a6653adab4c7121cddd13ea2d128b337a4))

# [1.7.0](https://github.com/saltstack-formulas/salt-formula/compare/v1.6.0...v1.7.0) (2020-10-12)


### Continuous Integration

* **pre-commit:** add to formula [skip ci] ([7ff962e](https://github.com/saltstack-formulas/salt-formula/commit/7ff962e2addd97e84dd99c87351b1412f64134af))
* **pre-commit:** enable/disable `rstcheck` as relevant [skip ci] ([426b29c](https://github.com/saltstack-formulas/salt-formula/commit/426b29c21149f5cef9064177177891a091c6bb82))
* **pre-commit:** finalise `rstcheck` configuration [skip ci] ([22fa616](https://github.com/saltstack-formulas/salt-formula/commit/22fa616f59864a77e3f7ea5b17e8a7f0bcf415be))


### Features

* add Gentoo support ([127c5d7](https://github.com/saltstack-formulas/salt-formula/commit/127c5d779b1e2b9beb7322a2d03a027c50e5c6d7))

# [1.6.0](https://github.com/saltstack-formulas/salt-formula/compare/v1.5.2...v1.6.0) (2020-09-20)


### Features

* enable the metadata grains server by default ([b1d296d](https://github.com/saltstack-formulas/salt-formula/commit/b1d296d270d3cc06332f569f81ee95fc78d95596))

## [1.5.2](https://github.com/saltstack-formulas/salt-formula/compare/v1.5.1...v1.5.2) (2020-09-20)


### Bug Fixes

* **jinja:** stop repeating user/group args ([e313401](https://github.com/saltstack-formulas/salt-formula/commit/e313401cd657a77a3624ed372c8e22e905c2d172))
* **windows:** dont run master state ([a36f2eb](https://github.com/saltstack-formulas/salt-formula/commit/a36f2eb2d2ab4e3d57885177f3438037b15318e3))
* **windows:** git.latest(parallel:true) does not work ([0c591bb](https://github.com/saltstack-formulas/salt-formula/commit/0c591bba95cebd341e73cdd0fc986428ee34ce7e))
* **windows:** group arg not supported on windows ([d61e671](https://github.com/saltstack-formulas/salt-formula/commit/d61e671fa0de58fe60c5c0cdc23d55c49b93dd01))
* **windows:** group name is users not root ([887d155](https://github.com/saltstack-formulas/salt-formula/commit/887d1559b5496dd07e730390f4309568d0428c2f))

## [1.5.1](https://github.com/saltstack-formulas/salt-formula/compare/v1.5.0...v1.5.1) (2020-08-25)


### Bug Fixes

* **service:** service salt-master and salt-minion to restart last ([d71cf0c](https://github.com/saltstack-formulas/salt-formula/commit/d71cf0c4f9ba716b93b784993f0409337e60fa18))
* **service:** svc `salt-master` watch `remove-default-master-conf-file` ([e1774e3](https://github.com/saltstack-formulas/salt-formula/commit/e1774e3b40c54b554552ecf34508c1bcbf5ffbd1))


### Styles

* **libtofs.jinja:** use Black-inspired Jinja formatting [skip ci] ([76e820c](https://github.com/saltstack-formulas/salt-formula/commit/76e820c36f6f0ea712001285dd79cbd5b54489e8))

# [1.5.0](https://github.com/saltstack-formulas/salt-formula/compare/v1.4.6...v1.5.0) (2020-07-15)


### Bug Fixes

* **macos:** use macos service names ([c72b183](https://github.com/saltstack-formulas/salt-formula/commit/c72b183f5ff885b30f0ac0fff8c9a847333a9304))
* **minion:** fix requisites from recent prs ([a466456](https://github.com/saltstack-formulas/salt-formula/commit/a46645607b3e20cf2f69a51e976457c201830c4c))


### Features

* **macos:** basic launchctl service support ([94027f7](https://github.com/saltstack-formulas/salt-formula/commit/94027f7332093764553162d9e80074029647f7ef))


### Tests

* **versions:** bump pkg versions ([37eb3b3](https://github.com/saltstack-formulas/salt-formula/commit/37eb3b35141885fe16ddc59d0ba45b29dbd5babe))

## [1.4.6](https://github.com/saltstack-formulas/salt-formula/compare/v1.4.5...v1.4.6) (2020-07-01)


### Bug Fixes

* **freebsd:** command `at` is already present in base system ([b6ab1b1](https://github.com/saltstack-formulas/salt-formula/commit/b6ab1b1d543908ea050cdb928a255dd4e2a3384d))

## [1.4.5](https://github.com/saltstack-formulas/salt-formula/compare/v1.4.4...v1.4.5) (2020-06-28)


### Bug Fixes

* **windows:** `py2` should still be default like other platforms ([62f6d39](https://github.com/saltstack-formulas/salt-formula/commit/62f6d39d63cc2e5c134571e20518f7da8c17e09e))


### Continuous Integration

* **github:** add Windows testing using Actions ([1eca9c7](https://github.com/saltstack-formulas/salt-formula/commit/1eca9c75519d9ad97dc6526fa83a56477da16579))


### Tests

* **windows:** add local testing of Windows using Vagrant/Virtualbox ([0465af7](https://github.com/saltstack-formulas/salt-formula/commit/0465af72dac6d8609f918ce32796c91157422358))

## [1.4.4](https://github.com/saltstack-formulas/salt-formula/compare/v1.4.3...v1.4.4) (2020-06-23)


### Continuous Integration

* **kitchen:** use `saltimages` Docker Hub where available [skip ci] ([f66a09c](https://github.com/saltstack-formulas/salt-formula/commit/f66a09c2d69bf676113be9073cd365860e8548a3))
* **kitchen+travis:** adjust matrix to add `3001` ([9060879](https://github.com/saltstack-formulas/salt-formula/commit/90608799249147f8c0d9e3189b865d8999dc4e5f))


### Tests

* **sodium:** add pillar and tests for `3001` ([42cacc2](https://github.com/saltstack-formulas/salt-formula/commit/42cacc253f9f0fbf1411ac19f9dc4169aef5d3f5))

## [1.4.3](https://github.com/saltstack-formulas/salt-formula/compare/v1.4.2...v1.4.3) (2020-06-01)


### Tests

* **pkgs_spec:** simplify using `match` (trigger: update for `suse`) ([b2b1fee](https://github.com/saltstack-formulas/salt-formula/commit/b2b1fee370060c82101526157dc2630a4453dfb8)), closes [/travis-ci.org/github/myii/salt-formula/jobs/692337807#L2366-L2381](https://github.com//travis-ci.org/github/myii/salt-formula/jobs/692337807/issues/L2366-L2381)

## [1.4.2](https://github.com/saltstack-formulas/salt-formula/compare/v1.4.1...v1.4.2) (2020-05-26)


### Bug Fixes

* **opensuse:** use appropriate upstream repo ([5d9a92b](https://github.com/saltstack-formulas/salt-formula/commit/5d9a92bf1d567cf25916239c2b11828fe625fd17))


### Continuous Integration

* **kitchen+travis:** adjust matrix to add `3000.3` [skip ci] ([a333801](https://github.com/saltstack-formulas/salt-formula/commit/a3338018fbf0f770c41a6523473eb42123daa435))
* **kitchen+travis:** adjust matrix to add `opensuse-leap-15.2` ([7fc32fb](https://github.com/saltstack-formulas/salt-formula/commit/7fc32fb0fb739a713c58d1642cd206106270322e))
* **kitchen+travis:** adjust matrix to add `opensuse-leap-15.2` ([1afa84e](https://github.com/saltstack-formulas/salt-formula/commit/1afa84e1af2132763b6dbdaff98892dd35bf9f1c))
* **travis:** add notifications => zulip [skip ci] ([7e2a9c0](https://github.com/saltstack-formulas/salt-formula/commit/7e2a9c0acd8dff358cfb80a14eaa596e3abf3e60))
* **workflows/commitlint:** add to repo [skip ci] ([38ebe56](https://github.com/saltstack-formulas/salt-formula/commit/38ebe5653b72fb5b9e11fdeef9c8f394600bd2ff))


### Tests

* **pkgs_spec:** update for releases `3000.3` & `2019.2.5` ([5917569](https://github.com/saltstack-formulas/salt-formula/commit/591756946403d17228a59b46ab48f6d1985743e2))
* **pkgs_spec:** update version installed on `fedora` ([301a988](https://github.com/saltstack-formulas/salt-formula/commit/301a9884ac0159ead8324b6ab4eaa170943b92f8))

## [1.4.1](https://github.com/saltstack-formulas/salt-formula/compare/v1.4.0...v1.4.1) (2020-05-02)


### Continuous Integration

* **gemfile.lock:** add to repo with updated `Gemfile` [skip ci] ([f10a85f](https://github.com/saltstack-formulas/salt-formula/commit/f10a85fc706aeba06453234b02bb5d8b0f00ad34))
* **kitchen+travis:** adjust matrix to add `3000.2` & remove `2018.3` ([433a2c1](https://github.com/saltstack-formulas/salt-formula/commit/433a2c1597fca67762cc41617d1a4056b6b6adc3))


### Tests

* add tests for `v3000-py2` ([c228029](https://github.com/saltstack-formulas/salt-formula/commit/c228029879f36ee5aaa5f3cd3d3684ede29808bb))
* **pkgs_spec:** update for CVE releases `3000.2` & `2019.2.4` ([965588b](https://github.com/saltstack-formulas/salt-formula/commit/965588b10808dea7dcf13fa651c95f61f2e4f83b))
* remove deprecated Salt/Python versions ([7f19796](https://github.com/saltstack-formulas/salt-formula/commit/7f19796517e920d0b1773b22724c68d5a8de681b))

# [1.4.0](https://github.com/saltstack-formulas/salt-formula/compare/v1.3.4...v1.4.0) (2020-04-18)


### Features

* **package:** use apt-pinning to pin specific package version ([98ad87a](https://github.com/saltstack-formulas/salt-formula/commit/98ad87a0014114f79fde1854dfb3731fad772ac4))


### Tests

* **pkgs_spec:** update `fedora` version [skip ci] ([e786eb6](https://github.com/saltstack-formulas/salt-formula/commit/e786eb6b8e8e3892046f6d56e719e119b16591b7))

## [1.3.4](https://github.com/saltstack-formulas/salt-formula/compare/v1.3.3...v1.3.4) (2020-04-03)


### Bug Fixes

* **api:** remove spurious colon in salt.api state ([02fbcd4](https://github.com/saltstack-formulas/salt-formula/commit/02fbcd43fc56e99fa62d7ab78658fa19e5d83372))

## [1.3.3](https://github.com/saltstack-formulas/salt-formula/compare/v1.3.2...v1.3.3) (2020-04-01)


### Continuous Integration

* **kitchen+travis:** adjust matrix to update `3000` to `3000.1` ([a8fe65a](https://github.com/saltstack-formulas/salt-formula/commit/a8fe65a2c80a63cb167ea6f7f88b1198b6e07b97))


### Tests

* **pkgs_spec:** update `3000` to `3000.1` ([1e677cd](https://github.com/saltstack-formulas/salt-formula/commit/1e677cd761ab82ff6160d7b96ce7f6920b2e02e4))
* **service_spec:** add `should be_installed` ([b5461a0](https://github.com/saltstack-formulas/salt-formula/commit/b5461a0ebab63fb77186ea5960e71bd1426609a1))

## [1.3.2](https://github.com/saltstack-formulas/salt-formula/compare/v1.3.1...v1.3.2) (2020-03-21)


### Code Refactoring

* **osfamilymap:** remove workaround for OpenSUSE 15.1 ([0da366c](https://github.com/saltstack-formulas/salt-formula/commit/0da366c7b25778dcec12f2a4a80cd4072c3d4d29))


### Continuous Integration

* **kitchen+travis:** adjust matrix to add `3000` & remove `2017.7` ([4a5f805](https://github.com/saltstack-formulas/salt-formula/commit/4a5f8053e938569814a2043405416c74b8c990fd))


### Tests

* **neon:** add pillar and tests for `3000` ([f91f10c](https://github.com/saltstack-formulas/salt-formula/commit/f91f10c2800edfc1b59fd731a6b6f82a47f74fcc))
* **nitrogen:** remove pillar and tests for `2017.7` ([f246a5e](https://github.com/saltstack-formulas/salt-formula/commit/f246a5e0af84f527df2f87428d929440c716361b))

## [1.3.1](https://github.com/saltstack-formulas/salt-formula/compare/v1.3.0...v1.3.1) (2020-03-19)


### Bug Fixes

* **jinja:** replace version_cmp with grains lookup ([dd37869](https://github.com/saltstack-formulas/salt-formula/commit/dd37869d2842927a87273b940fd76945ff6a05ec))
* **jinja:** replace version_cmp with grains lookup ([325f6c0](https://github.com/saltstack-formulas/salt-formula/commit/325f6c061beb2721cb55777e206922d728f62e69))

# [1.3.0](https://github.com/saltstack-formulas/salt-formula/compare/v1.2.0...v1.3.0) (2020-03-11)


### Features

* **mapping:** better control of the service's state ([29ffd68](https://github.com/saltstack-formulas/salt-formula/commit/29ffd68d3419b61b938221130911844f48134817))

# [1.2.0](https://github.com/saltstack-formulas/salt-formula/compare/v1.1.3...v1.2.0) (2020-02-20)


### Bug Fixes

* **libtofs:** “files_switch” mess up the variable exported by “map.jinja” [skip ci] ([4955737](https://github.com/saltstack-formulas/salt-formula/commit/4955737f844678ca3ca208340fe73fcd47aab256))


### Continuous Integration

* **kitchen+travis+inspec:** fix `amazonlinux-2-py3` [skip ci] ([10e2ce0](https://github.com/saltstack-formulas/salt-formula/commit/10e2ce07a4293ad46d785bcbc16b822280f17142))


### Features

* **metastate:** add metastate per community convention ([fbaa456](https://github.com/saltstack-formulas/salt-formula/commit/fbaa456ca69fafa2a8a4ef910b5e09dafffe5ece))

## [1.1.3](https://github.com/saltstack-formulas/salt-formula/compare/v1.1.2...v1.1.3) (2020-02-13)


### Bug Fixes

* **tpl_path:** replace slspath to tplroot ([bbcc4cd](https://github.com/saltstack-formulas/salt-formula/commit/bbcc4cda7ada4470db07dc02a5938a5b650e2f1c))


### Continuous Integration

* **kitchen:** avoid using bootstrap for `master` instances [skip ci] ([d2d5186](https://github.com/saltstack-formulas/salt-formula/commit/d2d51864a5e4e5584afa979378ded15b1c5b9366))

## [1.1.2](https://github.com/saltstack-formulas/salt-formula/compare/v1.1.1...v1.1.2) (2020-01-25)


### Code Refactoring

* **mapping:** simplify py version handling ([715e3b8](https://github.com/saltstack-formulas/salt-formula/commit/715e3b8fa495ed2c8e9f4a5fbbb6398021ac9ec7))

## [1.1.1](https://github.com/saltstack-formulas/salt-formula/compare/v1.1.0...v1.1.1) (2020-01-24)


### Continuous Integration

* **travis:** use `major.minor` for `semantic-release` version [skip ci] ([9d30df2](https://github.com/saltstack-formulas/salt-formula/commit/9d30df2f5f7405b9e354203f22a524b79a44ac15))


### Tests

* **pkgs_spec:** update `centos-8` for `2019.2.3` release ([7121d1d](https://github.com/saltstack-formulas/salt-formula/commit/7121d1d8cd67230a9f9dabecd1a6e11a14cfa109))
* **versions:** bump salt pkg versions ([c42125c](https://github.com/saltstack-formulas/salt-formula/commit/c42125c2ab1563b64e4768cf80955401a40a86ea))

# [1.1.0](https://github.com/saltstack-formulas/salt-formula/compare/v1.0.0...v1.1.0) (2019-12-19)


### Features

* **formulas:** git.latest parallelization ([eda88bd](https://github.com/saltstack-formulas/salt-formula/commit/eda88bd1a684c8d462e12db31fb29cbccdf67a3d))

# [1.0.0](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.9...v1.0.0) (2019-12-16)


### Continuous Integration

* **gemfile:** restrict `train` gem version until upstream fix [skip ci] ([fdc60ae](https://github.com/saltstack-formulas/salt-formula/commit/fdc60aed86c4b5d016aff0745584d89f614208fc))


### Features

* **per-formula-opts:** configure git.latest state per formula ([82c840d](https://github.com/saltstack-formulas/salt-formula/commit/82c840d6f96f69223c0df4b8463a072613a9d2df))
* **per-formula-opts:** configure git.latest state per formula ([9362277](https://github.com/saltstack-formulas/salt-formula/commit/9362277f2a61762b818dc775b30f15f93733efd5))


### BREAKING CHANGES

* **per-formula-opts:** Potential adverse affect on running `salt.formulas` with multiple envs

## [0.59.9](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.8...v0.59.9) (2019-12-03)


### Tests

* **pkgs_spec:** update for new `opensuse` package ([6da3d0d](https://github.com/saltstack-formulas/salt-formula/commit/6da3d0d9350bb6083f14073ee176fbd56fbad5ee)), closes [/travis-ci.com/saltstack-formulas/salt-formula/jobs/261961203#L1619-L1632](https://github.com//travis-ci.com/saltstack-formulas/salt-formula/jobs/261961203/issues/L1619-L1632)

## [0.59.8](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.7...v0.59.8) (2019-11-28)


### Bug Fixes

* **release.config.js:** use full commit hash in commit link [skip ci] ([67e1109](https://github.com/saltstack-formulas/salt-formula/commit/67e110973b9ddde1ea07889e8e40de97e29c96db))
* **shellcheck:** fix shellcheck error ([cc31514](https://github.com/saltstack-formulas/salt-formula/commit/cc3151436cecc921c992c6b520ad951bbd0f867f))


### Continuous Integration

* **travis:** apply changes from build config validation [skip ci] ([56c2eb5](https://github.com/saltstack-formulas/salt-formula/commit/56c2eb536709ff4b07413656b08a502954e15f97))
* **travis:** opt-in to `dpl v2` to complete build config validation [skip ci] ([33f69cf](https://github.com/saltstack-formulas/salt-formula/commit/33f69cfb7bd462230547d2cbe91474aeccb91975))
* **travis:** quote pathspecs used with `git ls-files` [skip ci] ([1a27b0a](https://github.com/saltstack-formulas/salt-formula/commit/1a27b0ae84a7433120fd82a644d7bfd02da18a40))
* **travis:** run `shellcheck` during lint job [skip ci] ([f4e8ae6](https://github.com/saltstack-formulas/salt-formula/commit/f4e8ae6871d9788f4b57fabd6e5962a44bf6982c))
* **travis:** use build config validation (beta) [skip ci] ([85593f5](https://github.com/saltstack-formulas/salt-formula/commit/85593f555e95928cfd0bafdc01ca4445baddd194))


### Performance Improvements

* **travis:** improve `salt-lint` invocation [skip ci] ([ef7e1c1](https://github.com/saltstack-formulas/salt-formula/commit/ef7e1c1e7b8eb97fcb859a85d919d78f553f82ed))

## [0.59.7](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.6...v0.59.7) (2019-10-29)


### Continuous Integration

* **kitchen+travis:** upgrade matrix after `2019.2.2` release ([](https://github.com/saltstack-formulas/salt-formula/commit/b6e3a83))
* **travis:** update `salt-lint` config for `v0.0.10` [skip ci] ([](https://github.com/saltstack-formulas/salt-formula/commit/4cbf0b2))


### Documentation

* **contributing:** remove to use org-level file instead [skip ci] ([](https://github.com/saltstack-formulas/salt-formula/commit/78d0fee))
* **readme:** update link to `CONTRIBUTING` [skip ci] ([](https://github.com/saltstack-formulas/salt-formula/commit/924817b))


### Tests

* **pkgs_spec:** update for `2019.2.2` release ([](https://github.com/saltstack-formulas/salt-formula/commit/acbc238))

## [0.59.6](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.5...v0.59.6) (2019-10-11)


### Tests

* **pkgs_spec:** reset version from `2019.2.1` back to `2019.2.0` ([](https://github.com/saltstack-formulas/salt-formula/commit/4787ce7))

## [0.59.5](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.4...v0.59.5) (2019-10-11)


### Bug Fixes

* **rubocop:** add fixes using `rubocop --safe-auto-correct` ([](https://github.com/saltstack-formulas/salt-formula/commit/62f82a4))


### Continuous Integration

* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/salt-formula/commit/64c6ba9))
* **travis:** merge `rubocop` linter into main `lint` job ([](https://github.com/saltstack-formulas/salt-formula/commit/4ea85e8))

## [0.59.4](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.3...v0.59.4) (2019-10-10)


### Bug Fixes

* **map.jinja:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/salt-formula/commit/5b348eb))
* **minion.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/salt-formula/commit/3e63977))
* **syndic.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/salt-formula/commit/ef4ad1e))


### Continuous Integration

* **kitchen:** install required packages to bootstrapped `opensuse` [skip ci] ([](https://github.com/saltstack-formulas/salt-formula/commit/8cc5952))
* **kitchen:** use bootstrapped `opensuse` images until `2019.2.2` [skip ci] ([](https://github.com/saltstack-formulas/salt-formula/commit/0c5eb7e))
* **platform:** add `arch-base-latest` (commented out for now) [skip ci] ([](https://github.com/saltstack-formulas/salt-formula/commit/8f36788))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/salt-formula/commit/e815eaa))

## [0.59.3](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.2...v0.59.3) (2019-09-25)


### Continuous Integration

* **kitchen:** change `log_level` to `debug` instead of `info` ([073175d](https://github.com/saltstack-formulas/salt-formula/commit/073175d))


### Tests

* **pkgs_spec:** update for `2019.2.1` release ([1bf9689](https://github.com/saltstack-formulas/salt-formula/commit/1bf9689))

## [0.59.2](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.1...v0.59.2) (2019-09-20)


### Bug Fixes

* **symlinks:** replace symlinks with real files ([c4d0132](https://github.com/saltstack-formulas/salt-formula/commit/c4d0132))

## [0.59.1](https://github.com/saltstack-formulas/salt-formula/compare/v0.59.0...v0.59.1) (2019-09-20)


### Bug Fixes

* **pkgrepo:** fix settings for `opensuse` ([f00c9a7](https://github.com/saltstack-formulas/salt-formula/commit/f00c9a7))
* **pkgrepo:** provide settings for `amazon` ([cb726af](https://github.com/saltstack-formulas/salt-formula/commit/cb726af))


### Code Refactoring

* **kitchen+travis+inspec:** use pre-salted images ([fc1d0b1](https://github.com/saltstack-formulas/salt-formula/commit/fc1d0b1))

# [0.59.0](https://github.com/saltstack-formulas/salt-formula/compare/v0.58.4...v0.59.0) (2019-09-17)


### Features

* use `semantic-release` cross-formula standard structure ([ebfeba2](https://github.com/saltstack-formulas/salt-formula/commit/ebfeba2))

## [0.58.4](https://github.com/saltstack-formulas/salt-formula/compare/v0.58.3...v0.58.4) (2019-08-25)


### Bug Fixes

* **minion:** fix version compare in minion.sls ([49bf81b](https://github.com/saltstack-formulas/salt-formula/commit/49bf81b))

## [0.58.3](https://github.com/saltstack-formulas/salt-formula/compare/v0.58.2...v0.58.3) (2019-08-02)


### Code Refactoring

* **linux:** align to template-formula (plus fixes) ([71b4d8a](https://github.com/saltstack-formulas/salt-formula/commit/71b4d8a))

## [0.58.2](https://github.com/saltstack-formulas/salt-formula/compare/v0.58.1...v0.58.2) (2019-08-01)


### Bug Fixes

* **macos:** fix minion package handling for homebrew ([14276e2](https://github.com/saltstack-formulas/salt-formula/commit/14276e2))
* **minion:** fix jinja rendering error ([550f81b](https://github.com/saltstack-formulas/salt-formula/commit/550f81b))
* **os:** pass state on unsupported os ([4557976](https://github.com/saltstack-formulas/salt-formula/commit/4557976))
* **perms:** some os have custom user/root ([beb0e85](https://github.com/saltstack-formulas/salt-formula/commit/beb0e85))

## [0.58.1](https://github.com/saltstack-formulas/salt-formula/compare/v0.58.0...v0.58.1) (2019-08-01)


### Bug Fixes

* **travis:** disable two failing platforms until they can be fixed ([5fcadcd](https://github.com/saltstack-formulas/salt-formula/commit/5fcadcd))

# [0.58.0](https://github.com/saltstack-formulas/salt-formula/compare/v0.57.1...v0.58.0) (2019-06-13)


### Features

* **`tofs`:** allow TOFS for master configuration ([1b202af](https://github.com/saltstack-formulas/salt-formula/commit/1b202af))
* **`tofs`:** allow TOFS for minion configuration ([fbe814a](https://github.com/saltstack-formulas/salt-formula/commit/fbe814a))

## [0.57.1](https://github.com/saltstack-formulas/salt-formula/compare/v0.57.0...v0.57.1) (2019-05-14)


### Documentation

* **semantic-release:** implement an automated changelog ([b73af20](https://github.com/saltstack-formulas/salt-formula/commit/b73af20))
