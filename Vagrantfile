Vagrant.configure("2") do |config|
  config.vm.define "linux-server-vm" do |linux_server_vm|
    linux_server_vm.vm.box = "bento/ubuntu-22.04"
    linux_server_vm.vm.network "private_network", type: "dhcp"
    linux_server_vm.vm.provider "vmware_desktop" do |v|
      v.memory = "1024"
      v.cpus = 2
    end
  end
end


