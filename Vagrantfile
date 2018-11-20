# vi: set ft=ruby :

$script = <<SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT


# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

def set_env vars
  command = <<~HEREDOC
      echo "Setting Environment Variables"
      source ~/.bashrc
  HEREDOC

  vars.each do |key, value|
    command += <<~HEREDOC
      if [ -z "$#{key}" ]; then
          echo "export #{key}=#{value}" >> ~/.bashrc
      fi
    HEREDOC
  end

  return command
end

Vagrant.configure("2") do |config|

  config.vm.define "app" do |app|
    # Use ubuntu/xenial64 as the virtual machine
    app.vm.box = "ubuntu/xenial64"
    # Use a private network to connect the VM to the local machine via an IP with an alias
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["development.local"]
    # sync the 'app' directory in the local directory to '/app' on the VM
    app.vm.synced_folder "app", "/app"
    # Use the provisioning script in envirnonment to provision the VM for a Sinatra environment
    app.vm.provision "shell", path: "environment/app/provision.sh"
    app.vm.provision "shell", inline: set_env({ DATABASE_URL: "postgresql://myapp:dbpass@localhost:15432/myapp" })
  end

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.host_name = "postgresql"
    db.vm.network "private_network", ip: "10.0.2.15"
    # db.vm.forward_port 8000, 8000
    db.hostsupdater.aliases = ["database.local"]
    # db.vm.share_folder "home", "/home/vagrant", ".", :create => true
    db.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
  end

end

# Vagrant::Config.run do |config|
#   config.vm.box = "ubuntu/trusty64"
#   config.vm.host_name = "postgresql"
#   config.hostsupdater.aliases = ["database.local"]
#   config.vm.share_folder "home", "/home/vagrant", ".", :create => true
#   config.vm.provision :shell, :path => "environment/db/provision.sh"
#
#   # PostgreSQL Server port forwarding
#   config.vm.forward_port 8000, 8000
# end
