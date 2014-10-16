# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "salt"
  config.vm.synced_folder "./", "/srv/salt", id: "vagrant-root"

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # Set up salt-master and minion
  config.vm.provision "shell", path: "dev/setup-salt.sh"
end
