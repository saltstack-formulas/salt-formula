{% from "salt/map.jinja" import salt_settings with context %}

{% if salt_settings.gitfs.pygit2.install_from_source %}
# we probably don't have a package or it's not a high enough version
# install latest from source/pip
pygit-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - python-dev
      - libssh-dev
      - libffi-dev
      - cmake

dl-libgit2-src:
  archive.extracted:
    - name: /usr/src
    - source: https://github.com/libgit2/libgit2/archive/v0.22.1.tar.gz
    - source_hash: md5=dbf516d18e176bbb131de3efccfee533
    - archive_format: tar
    - keep: True
    - if_missing: /usr/src/libgit2-0.22.1

/usr/src/libgit2-0.22.1/_build:
  file.directory

configure-libgit2:
  cmd.run:
    - name: cmake ..
    - cwd: /usr/src/libgit2-0.22.1/_build
    - creates: /usr/src/libgit2-0.22.1/_build/Makefile

build-libgit2:
  cmd.run:
    - name: make -j4
    - cwd: /usr/src/libgit2-0.22.1/_build
    - creates: /usr/src/libgit2-0.22.1/_build/libgit2.so

install-libgit2:
  cmd.run:
    - name: make install
    - cwd: /usr/src/libgit2-0.22.1/_build
    - creates: /usr/local/lib/libgit2.so

run-ldconfig-after-lib-install:
  cmd.run:
    - name: ldconfig
    - onchanges:
      - cmd: install-libgit2

install-pygit2:
  pip.installed:
    - name: pygit2

{% else %}
# install from package
# TODO haven't actually found a distro that has a good version to test
# debian jessie will have libgit2-21

{% endif %}
