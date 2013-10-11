#!/bin/bash

# Timer start
timerstart=$(date +"%s")

# Tested with Ubuntu 12.04 32bit
# Used vagrant

echo "Provisioning..."

# Start to Provisioning

echo "Updating System..."

# Checks if the OS is something other than ubuntu

if [ "$(uname)" == "Darwin" ]; then
  echo "Aborting...this script is for ubuntu linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  echo "Aborting...this script is for ubuntu linux"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo "Repo ... Update"
  apt-get -y --force-yes update
  sleep 2
  echo "Repo ... Upgrade"
  DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
  sleep 1
  apt-get -y --force-yes upgrade
  sleep 2
  echo "Installing ... Build and Debconf"
  apt-get -y --force-yes install build-essential debconf-utils
  sleep 2
  echo "Installing ... Security"
  apt-get -y --force-yes install ufw
  sleep 2
  echo "Installing ... Ruby"
  curl -L get.rvm.io | bash -s stable
  source /etc/profile.d/rvm.sh
  rvm install 2.0.0
  rvm use 2.0.0 --default
  echo "Installing ... Web Services and Nginx"
  #gem install rails --no-ri --no-rdoc
  #passenger req
  export rvmsudo_secure_path=1
  apt-get -y --force-yes install libcurl4-openssl-dev
  gem install passenger --no-ri --no-rdoc
  rvmsudo passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx
  # use -help for more passenger install options
  # Please specify a prefix directory [/opt/nginx]: 
  sleep 2
  echo "Adding ... Nginx initialisation script"
  # as this nginx is compiled via passenger, initialisation script has to be manually created
  wget -O init-deb.sh http://library.linode.com/assets/1139-init-deb.sh
  mv init-deb.sh /etc/init.d/nginx
  chmod +x /etc/init.d/nginx
  /usr/sbin/update-rc.d -f nginx defaults
  /etc/init.d/nginx start
  echo "Installing ... DB Services"
  DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install mysql-server
  #have funny error when mysql server install. need to check better force install -works fine as normal script
  sleep 2
  echo "Installing ... Php"
  #to add Phpmyadmin if possible
  apt-get -y --force-yes install php5-fpm php5-mysql
  sleep 2
  echo "Reboot Machine"
  reboot
fi

# Information output here

timerend=$(date +"%s")
timerdiff=$(($timerend-$timerstart))

echo "$(($timerdiff / 60)) minutes and $(($timerdiff % 60)) seconds elapsed."
echo "Done ..."
echo "Some notes to run; reset mysql server root pass: sudo dpkg-reconfigure mysql-server-5.5"
