#!/usr/bin/env sh
set -o nounset # Treat unset variables as an error and immediately exit
set -o errexit # If a command fails exit the whole script

if [ "${DEBUG:-false}" = "true" ]; then
  set -x # Run the entire script in debug mode
fi

if ! command -v pre-commit >/dev/null 2>&1; then
  echo "pre-commit not found: please install or check your PATH" >&2
  echo "See https://pre-commit.com/#installation" >&2
  exit 1
fi

pre-commit install --install-hooks
pre-commit install --hook-type commit-msg --install-hooks
