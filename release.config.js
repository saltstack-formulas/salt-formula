module.exports = {
  branch: 'master',
  plugins: [
      ['@semantic-release/commit-analyzer', {
        preset: 'angular',
        releaseRules: './release-rules.js',
      }],
      '@semantic-release/release-notes-generator',
      ['@semantic-release/changelog', {
        changelogFile: 'CHANGELOG.md',
        changelogTitle: '# Changelog',
      }],
      ['@semantic-release/exec', {
        prepareCmd: 'sh ./pre-commit_semantic-release.sh ${nextRelease.version}',
      }],
      ['@semantic-release/git', {
        assets: ['*.md', 'docs/*.rst', 'FORMULA'],
      }],
      '@semantic-release/github',
  ],
  generateNotes: {
    preset: 'angular',
    writerOpts: {
      // Required due to upstream bug preventing all types being displayed.
      // Bug: https://github.com/conventional-changelog/conventional-changelog/issues/317
      // Fix: https://github.com/conventional-changelog/conventional-changelog/pull/410
      transform: (commit, context) => {
          const issues = []

          commit.notes.forEach(note => {
              note.title = `BREAKING CHANGES`
          })

          // NOTE: Any changes here must be reflected in `CONTRIBUTING.md`.
          if (commit.type === `feat`) {
              commit.type = `Features`
          } else if (commit.type === `fix`) {
              commit.type = `Bug Fixes`
          } else if (commit.type === `perf`) {
              commit.type = `Performance Improvements`
          } else if (commit.type === `revert`) {
              commit.type = `Reverts`
          } else if (commit.type === `docs`) {
              commit.type = `Documentation`
          } else if (commit.type === `style`) {
              commit.type = `Styles`
          } else if (commit.type === `refactor`) {
              commit.type = `Code Refactoring`
          } else if (commit.type === `test`) {
              commit.type = `Tests`
          } else if (commit.type === `build`) {
              commit.type = `Build System`
          // } else if (commit.type === `chore`) {
          //     commit.type = `Maintenance`
          } else if (commit.type === `ci`) {
              commit.type = `Continuous Integration`
          } else {
              return
          }

          if (commit.scope === `*`) {
              commit.scope = ``
          }

          if (typeof commit.hash === `string`) {
              commit.shortHash = commit.hash.substring(0, 7)
          }

          if (typeof commit.subject === `string`) {
              let url = context.repository
                  ? `${context.host}/${context.owner}/${context.repository}`
                  : context.repoUrl
              if (url) {
                  url = `${url}/issues/`
                  // Issue URLs.
                  commit.subject = commit.subject.replace(/#([0-9]+)/g, (_, issue) => {
                      issues.push(issue)
                      return `[#${issue}](${url}${issue})`
                  })
              }
              if (context.host) {
                  // User URLs.
                  commit.subject = commit.subject.replace(/\B@([a-z0-9](?:-?[a-z0-9/]){0,38})/g, (_, username) => {
                  if (username.includes('/')) {
                      return `@${username}`
                  }

                  return `[@${username}](${context.host}/${username})`
                  })
              }
          }

          // remove references that already appear in the subject
          commit.references = commit.references.filter(reference => {
              if (issues.indexOf(reference.issue) === -1) {
                  return true
              }

              return false
          })

          return commit
      },
    },
  },
};
