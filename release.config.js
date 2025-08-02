module.exports = {
  // TODO: remove this when we no longer process releases on GitLab CI
  repositoryUrl: 'https://github.com/saltstack-formulas/salt-formula',
  plugins: [
    ['@semantic-release/commit-analyzer', {
      preset: 'angular',
      releaseRules: './release-rules.js'
    }],
    '@semantic-release/release-notes-generator',
    ['@semantic-release/changelog', {
      changelogFile: 'CHANGELOG.md',
      changelogTitle: '# Changelog'
    }],
    ['@semantic-release/exec', {
      // eslint-disable-next-line no-template-curly-in-string
      prepareCmd: 'sh ./pre-commit_semantic-release.sh ${nextRelease.version}'
    }],
    ['@semantic-release/git', {
      assets: ['*.md', 'docs/*.rst', 'FORMULA']
    }],
    '@semantic-release/github'
  ],
  generateNotes: {
    preset: 'angular'
  }
}
