# frozen_string_literal: true

control 'salt services' do
  title 'should be running'

  %w[
    salt-master
    salt-minion
  ].each do |p|
    describe service(p) do
      it { should be_enabled }
      it { should be_running }
    end
  end
end
