control 'salt packages' do
  title 'should be installed'

  describe package('salt-master') do
    it { should be_installed }
  end

  describe package('salt-minion') do
    it { should be_installed }
  end
end
