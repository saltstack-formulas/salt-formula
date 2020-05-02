# frozen_string_literal: true

# Prepare platform "finger"
platform_finger = "#{platform[:name]}-#{platform[:release].split('.')[0]}"

version =
  case platform[:family]
  when 'debian'
    '3000.2+ds-1'
  when 'redhat'
    case platform_finger
    when 'centos-8'
      '3000.2-1.el8'
    when 'centos-7'
      '3000.2-1.el7'
    when 'amazon-2'
      '3000.2-1.amzn2'
    end
  when 'fedora'
    # Issue in the upstream repo, should be `3000.2`
    '3000.1-1.fc31'
  when 'suse'
    # Issue in the upstream repo, should be `3000.2`
    '2019.2.0-lp151.28.1'
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
