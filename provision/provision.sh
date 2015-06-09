#!/bin/bash
sudo apt-get update -y

# Install dependencies
sudo apt-get install nginx-extras lua5.1 git-core luarocks -y
sudo luarocks install https://raw.githubusercontent.com/duhoobo/lua-resty-smtp/master/rockspec/resty.smtp-0.0.3-1.rockspec

# Configure Nginx
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/vagrant/proj/app/nginx.conf /etc/nginx/sites-available/default
sudo /etc/init.d/nginx restart