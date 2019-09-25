# Changelog

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
