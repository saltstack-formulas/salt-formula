case os[:name]
when 'centos'
  version = '2018.3.4-1.el7'
when 'debian', 'ubuntu'
  version = '2018.3.4+ds-1'
when 'fedora'
  version = '2018.3.2-5.fc29'
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
