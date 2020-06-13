# frozen_string_literal: true

<<<<<<< HEAD
version =
  case platform[:family]
  when 'redhat'
    case platform[:name]
    when 'amazon'
      '2019.2.3-1.amzn2'
    when 'centos'
      '2019.2.3-1.el8'
    end
  when 'suse'
    '2019.2.0-lp151.5.9.1'
  when 'debian'
    '2019.2.3+ds-1'
  end

=======
>>>>>>> 43dd0c7efc57c6da83477218ba1038bcf42ba945
control 'salt packages' do
  title 'should be installed'

  version = '2019.2.5'

  %w[
    salt-master
    salt-minion
  ].each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should match(/^#{version}/) }
    end
  end
end
