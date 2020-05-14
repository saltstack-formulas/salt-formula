# frozen_string_literal: true

# Prepare platform "finger"
platform_finger = "#{platform[:name]}-#{platform[:release].split('.')[0]}"

version =
  case platform[:family]
  when 'debian'
    '2019.2.5+ds-1'
  when 'redhat'
    case platform_finger
    when 'centos-7'
      '2019.2.5-1.el7'
    when 'centos-6'
      '2019.2.5-1.el6'
    when 'amazon-2'
      '2019.2.5-1.amzn2'
    when 'amazon-2018'
      '2019.2.5-1.amzn1'
    end
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
