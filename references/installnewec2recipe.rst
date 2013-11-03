Ubuntu LTS 12.04

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install zip build-essential git-core
sudo apt-get mysql-server mysql-client
sudo apt-get -y install nginx php5-fpm
/etc/init.d/nginx start
sudo reboot

>> copy config file to nginx config folder or change contents (/etc/nginx/nginx.conf)
>> cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

==============================
Notes
==============================

- Ec2 volumes is used as boot volume. So to restore, create new instance and replace with sda1 (not sure if future is allowed)
- Should try to use mount Ec2 as other volume i.e. sdf then place data on mount, like websites. (perhaps bad idea as architecture is not simple.)

- railsless deploy (gem install railsless-deploy)