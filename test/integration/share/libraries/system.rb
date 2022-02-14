# frozen_string_literal: true

# system.rb -- InSpec resources for system values
# Author: Daniel Dehennin <daniel.dehennin@ac-dijon.fr>
# Copyright (C) 2020 Daniel Dehennin <daniel.dehennin@ac-dijon.fr>

# rubocop:disable Metrics/ClassLength
class SystemResource < Inspec.resource(1)
  name 'system'

  attr_reader :platform

  def initialize
    super
    @platform = build_platform
  end

  private

  def build_platform
    {
      family: build_platform_family,
      name: build_platform_name,
      release: build_platform_release,
      finger: build_platform_finger,
      codename: build_platform_codename
    }
  end

  def build_platform_family
    case inspec.platform[:name]
    when 'arch', 'gentoo'
      inspec.platform[:name]
    else
      inspec.platform[:family]
    end
  end

  def build_platform_name
    case inspec.platform[:name]
    when 'amazon', 'oracle', 'rocky'
      "#{inspec.platform[:name]}linux"
    when /^windows_/
      inspec.platform[:family]
    else
      inspec.platform[:name]
    end
  end

  # rubocop:disable Metrics/MethodLength,Metrics/AbcSize,Metrics/CyclomaticComplexity
  def build_platform_release
    case inspec.platform[:name]
    when 'amazon'
      # `2018` relase is named `1` in `kitchen.yml`
      inspec.platform[:release].gsub(/2018.*/, '1')
    when 'arch'
      'base-latest'
    when 'gentoo'
      "#{inspec.platform[:release].split('.')[0]}-#{derive_gentoo_init_system}"
    when 'opensuse'
      # rubocop:disable Style/NumericLiterals,Layout/LineLength
      inspec.platform[:release].to_i > 20210101 ? 'tumbleweed' : inspec.platform[:release]
      # rubocop:enable Style/NumericLiterals,Layout/LineLength
    when 'windows_8.1_pro'
      '8.1'
    when 'windows_server_2022_datacenter'
      '2022-server'
    when 'windows_server_2019_datacenter'
      '2019-server'
    when 'windows_server_2016_datacenter'
      '2016-server'
    else
      inspec.platform[:release]
    end
  end
  # rubocop:enable Metrics/MethodLength,Metrics/AbcSize,Metrics/CyclomaticComplexity

  def derive_gentoo_init_system
    inspec.command('systemctl').exist? ? 'sysd' : 'sysv'
  end

  def build_platform_finger
    "#{build_platform_name}-#{build_finger_release}"
  end

  def build_finger_release
    case inspec.platform[:name]
    when 'ubuntu'
      build_platform_release.split('.').slice(0, 2).join('.')
    else
      build_platform_release.split('.')[0]
    end
  end

  # rubocop:disable Metrics/MethodLength,Metrics/CyclomaticComplexity
  def build_platform_codename
    case build_platform_finger
    when 'ubuntu-20.04'
      'focal'
    when 'ubuntu-18.04'
      'bionic'
    when 'debian-11'
      'bullseye'
    when 'debian-10'
      'buster'
    when 'debian-9'
      'stretch'
    when 'almalinux-8'
      "AlmaLinux #{build_platform_release} (Arctic Sphynx)"
    when 'amazonlinux-2'
      'Amazon Linux 2'
    when 'arch-base-latest'
      'Arch Linux'
    when 'centos-7'
      'CentOS Linux 7 (Core)'
    when 'centos-8'
      'CentOS Stream 8'
    when 'opensuse-tumbleweed'
      'openSUSE Tumbleweed'
    when 'opensuse-15'
      "openSUSE Leap #{build_platform_release}"
    when 'oraclelinux-8', 'oraclelinux-7'
      "Oracle Linux Server #{build_platform_release}"
    when 'gentoo-2-sysd', 'gentoo-2-sysv'
      'Gentoo/Linux'
    when 'rockylinux-8'
      "Rocky Linux #{build_platform_release} (Green Obsidian)"
    else
      ''
    end
  end
  # rubocop:enable Metrics/MethodLength,Metrics/CyclomaticComplexity
end
# rubocop:enable Metrics/ClassLength
