Vagrant.configure("2") do |config|
  config.vm.define "linux-server-vm" do |linux_server_vm|
    linux_server_vm.vm.box = "bento/ubuntu-22.04"
    linux_server_vm.vm.network "forwarded_port", guest: 80, host: 8080
    linux_server_vm.vm.hostname = "linux-server-vm"
    linux_server_vm.vm.provision "shell", path: "script.sh"
    linux_server_vm.vm.provider "vmware_desktop" do |v|
      v.memory = "1024"
      v.cpus = 2
    end
  end
end


