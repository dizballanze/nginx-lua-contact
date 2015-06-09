#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx-extras lua5.1 lua-socket -y
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/vagrant/proj/app/nginx.conf /etc/nginx/sites-available/default
sudo /etc/init.d/nginx restart