# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

MEMORY=2048
CORES=2

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'hashicorp/precise64'
  config.vm.hostname = 'pinfinity-host'

  config.vm.provider :virtualbox do |v|
    # Use VBoxManage to customize the VM. For example to change memory:
    v.customize ["modifyvm", :id, "--memory", MEMORY.to_i]
    v.customize ["modifyvm", :id, "--cpus", CORES.to_i]

    if CORES.to_i > 1
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.network 'forwarded_port', guest: 8080, host: 8080

  config.vm.synced_folder "./properties", "/properties"

  config.ssh.forward_agent = true
  config.vm.provision 'shell', path: 'scripts/setup.sh'
end
