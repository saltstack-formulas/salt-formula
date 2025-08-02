#!/bin/sh

###############################################################################
# (A) Update `FORMULA` with `${nextRelease.version}`
###############################################################################

sed -i -e "s_^\(version:\).*_\1 ${1}_" FORMULA


###############################################################################
# (B) Update `AUTHORS.md`
###############################################################################

maintainer contributor --ignore-contributors semantic-release-bot,renovate[bot]

###############################################################################
# (C) Use `m2r` to convert automatically produced `.md` docs to `.rst`
###############################################################################

# Copy and then convert the `.md` docs
cp ./*.md docs/
cd docs/ || exit
m2r --overwrite ./*.md

# Change excess `H1` headings to `H2` in converted `CHANGELOG.rst`
sed -i -e '/^=.*$/s/=/-/g' CHANGELOG.rst
sed -i -e '1,4s/-/=/g' CHANGELOG.rst

# Use for debugging output, when required
# cat AUTHORS.rst
# cat CHANGELOG.rst

# Return back to the main directory
cd ..
