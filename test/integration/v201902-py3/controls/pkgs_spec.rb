# frozen_string_literal: true

# Prepare platform "finger"
platform_finger = "#{platform[:name]}-#{platform[:release].split('.')[0]}"

version =
  case platform[:family]
  when 'debian'
    '2019.2.5+ds-1'
  when 'redhat'
    case platform_finger
    when 'centos-8'
      '2019.2.5-1.el8'
    when 'centos-7'
      '2019.2.5-1.el7'
    when 'amazon-2'
      '2019.2.5-1.amzn2'
    end
  when 'fedora'
    # Issue in the upstream repo, should be `3000.3`
    '3000.2-1.fc31'
  when 'suse'
    # Issue in the upstream repo, should be `2019.2.5`
    '2019.2.0-lp151.37.1'
  end

control 'salt packages' do
  title 'should be installed'

  %w[
    salt-master
    salt-minion
  ].each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should eq version }
    end
  end
end
