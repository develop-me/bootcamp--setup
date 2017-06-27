#! /bin/bash

clear

printf "\e[35m
  ____                 _             __  __           
 |  _ \  _____   _____| | ___  _ __ |  \/  | ___      
 | | | |/ _ \ \ / / _ \ |/ _ \| '_ \| |\/| |/ _ \     
 | |_| |  __/\ V /  __/ | (_) | |_) | |  | |  __/     
 |____/ \___| \_/ \___|_|\___/| .__/|_|  |_|\___|____ 
                              |_|              |_____|
 \e[32m
 Windows Setup Script v1.0

 —————————————————————————————————————————————————————

 This will install the following command line tools:

 • Git: version control made simple(ish)
 • Node: JavaScript on the command line 
 • Sass: makes CSS betterer 
 • Composer: installs all the PHP things 

 —————————————————————————————————————————————————————

 Ready? (y/n) \e[39m"

read -r input

if ([ "$input" == "no" ] || [ "$input" == "n" ]); then
    exit 1
fi

if [ "$USER" == "root" ]; then
    printf "
 
 Pick a username (lowercase, no spaces): "
    read -r username

    # create user
    useradd "$username" -m

    # add to sudo group
    sudo adduser "$username" sudo

    # set password
    passwd "$username"

    su "$username" 
fi

printf "\e[34m
 Ok, let's go...

 \e[39m
"

mkdir ~/bin

# allow non standard repos
sudo apt-get install python-software-properties

# add latest node repo
cd ~
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

sudo apt-get install -y git php7.0 ruby nodejs
sudo gem install sass

# ===============================================================

# composer
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    printf "\e[31mComposer couldn't be installed\e[39m"
else
    php composer-setup.php --quiet
    cp composer.phar ~/bin/composer
fi

rm composer-setup.php
source ~/.profile

# ===============================================================

printf "\e[35m

 And we're done!
 \e[39m
"

sleep 2

exit
