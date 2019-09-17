case os[:name]
when 'centos'
  version = '2019.2.0-1.el7'
when 'fedora'
  version = '2019.2.0-1.fc30'
when 'opensuse'
  version = '2019.2.0-lp150.3.33.1'
when 'debian', 'ubuntu'
  version = '2019.2.0+ds-1'
end

control 'salt packages' do
  title 'should be installed'

  %w(
    salt-master
    salt-minion
  ).each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should eq version }
    end
  end
end
