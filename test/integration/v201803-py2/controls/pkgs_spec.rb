version =
  case platform[:family]
  when 'redhat'
    '2018.3.4-1.el7'
  when 'debian'
    '2018.3.4+ds-1'
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
