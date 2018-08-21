# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
   config.vm.box = "ubuntu/bionic64"
   config.vm.network "forwarded_port", guest: 80, host: 80
   config.vm.network "private_network", ip: "192.168.111.111", auto_correct: true
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
   end
  
config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2
     apt-get install -y php7.2
     apt-get install -y php-xml
     apt-get install -y php-gd
     apt-get install -y php-mbcrypt
     apt-get install -y php-curl
     apt-get install -y php-zip
     apt-get install -y php-xdebug
     apt-get install -y php-mbstring
     apt-get install -y php-mysql
     apt-get install -y git
     apt-get install -y imagemagick
     apt-get install -y samba-common samba 
     apt-get install -y mysql-server
     apt-get install -y zip
     apt-get upgrade -y
     locale-gen de_CH.UTF-8
     a2enmod rewrite
     mysql -u root 
     mysql -u root --execute=ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'toor';""
     wget https://getcomposer.org/composer.phar
     mv ./composer.phar  /usr/local/bin/composer
     chmod +x /usr/local/bin/composer
     composer global require hirak/prestissimo
     rm -rf /var/www/
     mkdir -p /var/www/htdocs
     chown -R www-data:www-data /var/www
     adduser www-data sudo
     usermod -s /bin/bash www-data
     cd /etc/apache2/sites-enabled
     rm -rf ./*
     ln -s /var/www/htdocs/vhost.conf 
     su www-data
     touch /var/www/htdocs/vhost.conf
     cd ~/
     ## Setup Samba
     chmod 646 /etc/samba/smb.conf
     echo "[Webserver]" >> /etc/samba/smb.conf 
     echo "path = /var/www/htdocs" >> /etc/samba/smb.conf 
     echo "force user = www-data" >> /etc/samba/smb.conf 
     echo "writeable = yes" >> /etc/samba/smb.conf 
     chmod 644 /etc/samba/smb.conf
     ## CHANGE THIS
     su www-data
     ssh-keygen
     curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
     export NVM_DIR="$HOME/.nvm"
     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
     [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
     nvm install 9.0.0
     npm install -g gulp
     npm install -g gulp-cli
     git config --global user.email "simon.d.mueller@gmail.com"
     git config --global user.name "Simon D. Müller"
   SHELL
end
