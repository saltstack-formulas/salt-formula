control 'salt services' do
  title 'should be running'

  describe service('salt-master') do
    it { should be_enabled }
    it { should be_running }
  end

  describe service('salt-minion') do
    it { should be_enabled }
    it { should be_running }
  end

end
