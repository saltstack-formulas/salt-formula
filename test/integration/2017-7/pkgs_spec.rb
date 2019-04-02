case os[:name]
when 'centos'
  version = '2017.7.8-1.el6'
when 'debian', 'ubuntu'
  version = '2017.7.8+ds-1'
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
