#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install git
sudo apt-get install git -y

# install the packages required for the ruby-build tool to build Ruby from source
sudo apt-get -y install make build-essential libcurl4-openssl-dev libmysqlclient-dev libreadline-dev libssl-dev libxml2-dev libxslt-dev python-dev zlib1g-dev

# run the following curl command to install both rbenv and ruby-build
sudo -u vagrant -H git clone git://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
# Add $HOME/.rbenv/bin to the system PATH
sudo -u vagrant echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.profile
sudo -u vagrant echo 'eval "$(rbenv init -)"' >> /home/vagrant/.profile
# install ruby build
sudo -u vagrant -H git clone git://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

# rehash rbenv
sudo -u vagrant -i rbenv rehash

# Install the latest stable version of Ruby and set it as a default version
sudo -u vagrant -i rbenv install 2.5.1
sudo -u vagrant -i rbenv global 2.5.1
sudo -u vagrant -i ruby -v

# install bundler
sudo -u vagrant -i gem install bundler --no-ri --no-rdoc
sudo -u vagrant -i gem install rack
