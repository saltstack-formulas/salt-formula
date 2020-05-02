# frozen_string_literal: true

version =
  case platform[:family]
  when 'debian'
    '3000.2+ds-1'
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
