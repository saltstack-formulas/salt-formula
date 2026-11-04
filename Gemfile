# frozen_string_literal: true

# This is a placeholder version to remind us to update the Gemfile
# when a new stable Chef Workstation is released
# renovate: chef-workstation 25.14.2

source ENV.fetch('PROXY_RUBYGEMSORG', 'https://rubygems.org')

# Install the `inspec` gem using `git` because versions after `4.22.22`
# suppress diff output; this version fixes this for our uses.
# rubocop:disable Layout/LineLength
gem 'inspec', git: 'https://gitlab.com/saltstack-formulas/infrastructure/inspec', branch: 'ssf'
# rubocop:enable Layout/LineLength

# Install the `kitchen-docker` gem using `git` in order to avoid an upstream
# error caused by `kitchen-docker.gemspec`.
# TODO: correct the error upstream
# rubocop:disable Layout/LineLength
gem 'kitchen-docker', git: 'https://github.com/dafyddj/kitchen-docker', branch: 'chore/gemspec'
# rubocop:enable Layout/LineLength

gem 'kitchen-inspec', '3.1.0'
gem 'kitchen-salt', '0.7.2'

gem 'net-ssh', '7.3.2'

gem 'test-kitchen', '4.0.0'
