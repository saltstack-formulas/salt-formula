# frozen_string_literal: true

pkgs =
  case system.platform[:name]
  when 'arch'
    %w[salt]
  when /bsd$/
    %w[py37-salt]
  when 'windows'
    %w[Salt\ Minion]
  else
    %w[salt-master salt-minion]
  end

control 'salt packages' do
  title 'should be installed'

  version = '3003'

  pkgs.each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should match(/^#{version}/) }
    end
  end
end
