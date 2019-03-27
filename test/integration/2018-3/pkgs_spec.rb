case os[:name]
when 'centos'
  version = '2018.3.4-1.el6'
when 'debian', 'ubuntu'
  version = '2018.3.4+ds-1'
when 'opensuse'
  version = '2018.3.0-42.1'
when 'fedora'
  version = '2018.3.0-1.fc28'
end

control 'salt packages' do
  title 'should be installed'

  describe package('salt-master') do
    it { should be_installed }
    its('version') { should eq version }
  end

  describe package('salt-minion') do
    it { should be_installed }
    its('version') { should eq version }
  end
end
