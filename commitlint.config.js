module.exports = {
    extends: ['@commitlint/config-conventional'],
    rules: {
        'body-max-line-length': [2, 'always', 120],
        'footer-max-line-length': [2, 'always', 120],
        'header-max-length': [2, 'always', 72],
    },
    ignores: [
        (commit) => commit.startsWith("chore(copier):"),
        (commit) => commit.startsWith("chore(deps):"),
        (commit) => commit.startsWith("ci(pre-commit.ci):"),
        (commit) => commit.startsWith("[CI merge]")
    ],
};
