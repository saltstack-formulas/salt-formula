# InSpec Profile: `v201902-py2`

This shows the implementation of the `v201902-py2` InSpec [profile](https://github.com/inspec/inspec/blob/master/docs/profiles.md).

## Verify a profile

InSpec ships with built-in features to verify a profile structure.

```bash
$ inspec check v201902-py2
Summary
-------
Location: v201902-py2
Profile: profile
Controls: 4
Timestamp: 2019-06-24T23:09:01+00:00
Valid: true

Errors
------

Warnings
--------
```

## Execute a profile

To run all **supported** controls on a local machine use `inspec exec /path/to/profile`.

```bash
$ inspec exec v201902-py2
..

Finished in 0.0025 seconds (files took 0.12449 seconds to load)
8 examples, 0 failures
```

## Execute a specific control from a profile

To run one control from the profile use `inspec exec /path/to/profile --controls name`.

```bash
$ inspec exec v201902-py2 --controls package
.

Finished in 0.0025 seconds (files took 0.12449 seconds to load)
1 examples, 0 failures
```

See an [example control here](https://github.com/inspec/inspec/blob/master/examples/profile/controls/example.rb).
