# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-docker-compose")
  system("vagrant plugin install vagrant-docker-compose")
  puts "Dependencies installed, restarting vagrant again ..."
  exec "vagrant #{ARGV.join(' ')}"
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.provider :virtualbox do |vb|
      vb.memory=1024
      vb.name="ispass-docker-tutorial-master-vm"
  end

  config.vm.post_up_message = "Please execute `vagrant ssh` to connect to the virtual machine."

  config.vm.define "master", primary: true do |master|
    master.vm.box      = "ispass-docker-tutorial"
    master.vm.hostname = "master"
    master.vm.box_url  = "file://#{Dir.pwd}/boxes/ispass-docker-tutorial.box"

    master.ssh.forward_x11 = true # enables X11 forwarding over SSH connections.

    master.vm.network "private_network", ip: "10.100.100.10", netmask:"255.255.0.0"
    master.vm.network :forwarded_port, host: 5000, guest: 5000, auto_correct: true
    master.vm.synced_folder ".", "/vagrant", disabled: true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host node. The second one argument is the path on the guest 
    # to mount the folder.
    master.vm.synced_folder "#{Dir.pwd}/dockerfiles", 
                            "/home/vagrant/tutorial",
                            disabled: false
   end
end