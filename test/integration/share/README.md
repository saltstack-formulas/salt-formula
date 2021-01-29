# InSpec Profile: `share`

This shows the implementation of the `share` InSpec [profile](https://github.com/inspec/inspec/blob/master/docs/profiles.md).

Its goal is to share the libraries between all profiles.

## Libraries

### `system`

The `system` library provides easy access to system dependent information:

- `system.platform`: based on `inspec.platform`, modify to values that are more consistent from a SaltStack perspective
  - `system.platform[:family]` provide a family name for Arch and Gentoo
  - `system.platform[:name]` append `linux` to both `amazon` and `oracle`; ensure Windows platforms are resolved as simply `windows`
  - `system.platform[:release]` tweak Arch, Amazon Linux, Gentoo, openSUSE and Windows:
    - `Arch` is always `base-latest`
    - `Amazon Linux` release `2018` is resolved as `1`
    - `Gentoo` release is trimmed to its major version number and then the init system is appended (i.e. `sysv` or `sysd`)
    - `openSUSE` is resolved as `tumbleweed` if the `platform[:release]` is in date format
    - `Windows` uses the widely-used release number (e.g. `8.1` or `2019-server`) in place of the actual system release version
  - `system.platform[:finger]` is the concatenation of the name and the major release number (except for Ubuntu, which gives `ubuntu-20.04` for example)
