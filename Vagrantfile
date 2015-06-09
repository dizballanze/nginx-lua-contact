Vagrant.configure(2) do |config|
  # Virtual machine parameters
  config.vm.box = "debian/jessie64"
  config.vm.network "private_network", ip: "10.1.1.95"
  config.vm.synced_folder ".", "/home/vagrant/proj"
  config.vm.hostname = "nginx-lua"
  config.vm.post_up_message = "nginx_lua dev server successfuly started.
    Connect to host with:
    http://10.1.1.95/
    or over ssh with `vagrant ssh`"
  # Set box name
  config.vm.define :nginx_lua do |t|
  end
  # Virtualbox specific parameters
  config.vm.provider "virtualbox" do |v|
    v.name = "nginx_lua"
    v.memory = 1024
    v.cpus = 2
  end
  # Provisioning with shell script
  config.vm.provision "shell",
    path: "provision/provision.sh",
    privileged: false
end