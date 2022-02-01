# frozen_string_literal: true

source ENV['PROXY_RUBYGEMSORG'] || 'https://rubygems.org'

# Install the `inspec` gem using `git` because versions after `4.22.22`
# suppress diff output; this version fixes this for our uses.
# rubocop:disable Layout/LineLength
gem 'inspec', git: 'https://gitlab.com/saltstack-formulas/infrastructure/inspec', branch: 'ssf'
# rubocop:enable Layout/LineLength

# Install the `kitchen-docker` gem using `git` in order to gain a performance
# improvement: avoid package installations which are already covered by the
# `salt-image-builder` (i.e. the pre-salted images that we're using)
# rubocop:disable Layout/LineLength
gem 'kitchen-docker', git: 'https://gitlab.com/saltstack-formulas/infrastructure/kitchen-docker', branch: 'ssf'
# rubocop:enable Layout/LineLength

gem 'kitchen-inspec', '>= 2.5.0'
gem 'kitchen-salt', '>= 0.7.2'

group :vagrant do
  gem 'kitchen-vagrant'
end
