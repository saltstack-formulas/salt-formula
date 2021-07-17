# frozen_string_literal: true

source 'https://rubygems.org'

# Use the latest version of `inspec` prior to `4.23.4`, which introduces a
# regression where the diff isn't displayed when comparing using `eq`.
gem 'inspec',      '~> 4.22.22'
# Install the `kitchen-docker` gem using `git` because the latest version
# currently available (`2.10.0`) doesn't include a recent fix for Gentoo.
# rubocop:disable Layout/LineLength
gem 'kitchen-docker', git: 'https://gitlab.com/saltstack-formulas/infrastructure/kitchen-docker', branch: 'ssf'
# rubocop:enable Layout/LineLength
gem 'kitchen-inspec', '>= 2.5.0'
gem 'kitchen-salt', '>= 0.6.3'

group :vagrant do
  gem 'kitchen-vagrant'
end
