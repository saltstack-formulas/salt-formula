# frozen_string_literal: true

version =
  case platform[:family]
  when 'redhat'
    case platform[:name]
    when 'amazon'
      '2019.2.3-1.amzn2'
    when 'centos'
      '2019.2.3-1.el8'
    end
  when 'fedora'
    '2019.2.1rc0-3.fc31'
  when 'suse'
    '2019.2.0-lp151.5.9.1'
  when 'debian'
    '2019.2.3+ds-1'
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
