// No release is triggered for the types commented out below.
// Commits using these types will be incorporated into the next release.
//
// NOTE: Any changes here must be reflected in `CONTRIBUTING.md`.
module.exports = [
  {breaking: true, release: 'major'},
  // {type: 'build', release: 'patch'},
  // {type: 'chore', release: 'patch'},
  // {type: 'ci', release: 'patch'},
  {type: 'docs', release: 'patch'},
  {type: 'feat', release: 'minor'},
  {type: 'fix', release: 'patch'},
  {type: 'perf', release: 'patch'},
  {type: 'refactor', release: 'patch'},
  {type: 'revert', release: 'patch'},
  {type: 'style', release: 'patch'},
  {type: 'test', release: 'patch'},
];
