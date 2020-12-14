# frozen_string_literal: true

pkgs =
  case platform[:family]
  when 'windows'
    %w[Salt\ Minion]
  else
    %w[salt-master salt-minion]
  end

control 'salt packages' do
  title 'should be installed'

  version = '3000'

  pkgs.each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should match(/^#{version}/) }
    end
  end
end
