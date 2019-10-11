# frozen_string_literal: true

version =
  case platform[:family]
  when 'redhat'
    case platform[:name]
    when 'amazon'
      '2017.7.8-1.el7'
    when 'centos'
      '2017.7.8-1.el6'
    end
  when 'debian'
    '2017.7.8+ds-1'
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
