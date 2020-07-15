# frozen_string_literal: true

control 'salt packages' do
  title 'should be installed'

  version = '3001'

  %w[
    salt-master
    salt-minion
  ].each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should match(/^#{version}/) }
    end
  end
end
