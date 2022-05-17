# frozen_string_literal: true

pkgs =
  case system.platform[:name]
  when 'arch'
    %w[salt]
  when /bsd$/
    %w[py38-salt]
  when 'windows'
    ['Salt Minion']
  when 'mac_os_x'
    %w[salt saltstack]
  else
    %w[salt-master salt-minion]
  end

control 'salt packages' do
  title 'should be installed'

  pkgs.each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should match(/^#{input('saltmajorversion')}/) }
    end
  end
end
