#! /bin/bash

# stop on first error
set -e

# ===============================================================

vagrant_version="2.2.9"
php_version="7.4"
node_version="14.x"

vagrant_plugins=(
    vagrant-vbguest
    vagrant-hostsupdater
)

# ===============================================================

clear

printf "\e[35m
  ____                 _             __  __
 |  _ \  _____   _____| | ___  _ __ |  \/  | ___
 | | | |/ _ \ \ / / _ \ |/ _ \| '_ \| |\/| |/ _ \
 | |_| |  __/\ V /  __/ | (_) | |_) | |  | |  __/
 |____/ \___| \_/ \___|_|\___/| .__/|_|  |_|\___|____
                              |_|              |_____|

 \e[32m
 Linux Setup Script

 —————————————————————————————————————————————————————

 This will install the following command line tools:

 • Git: version control made simple(ish)
 • Node: JavaScript on the command line
 • Sass: makes CSS betterer
 • Composer: installs all the PHP things
 • ZSH: a nicer command-line experience

 —————————————————————————————————————————————————————

 Ready? (y/n) \e[39m"

read -r input

if ([ "$input" == "no" ] || [ "$input" == "n" ]); then
    exit 1
fi

printf "\e[34m

 Ok, let's go...

 Stage 1: Setting up linux package manager...
 \e[39m
"

# allow non standard repos
sudo apt-get update -y

# add latest node repo
curl -sL "https://deb.nodesource.com/setup_${node_version}" | sudo -E bash -

# add PHP repo
sudo add-apt-repository ppa:ondrej/php
sudo apt update

printf "\e[35m

 Stage 2: Installing binaries...
 (This can take a while - downloading a lot of files!)

 \e[39m
"

# install various things - separate to avoid one error stopping everything
sudo apt-get install -y git
sudo apt-get install -y "php${php_version}" "php${php_version}-zip" "php${php_version}-mbstring" "php${php_version}-dom"
sudo apt-get install -y gcc make ruby ruby-dev
sudo apt-get install -y nodejs
sudo apt-get install -y zsh
sudo apt-get install -y virtualbox

sudo npm install gulp-cli sass -g

# make git log more usable
git config --global --replace-all core.pager "less -iXFR"

# ===============================================================

# composer
printf "\e[35m

 Stage 3: Setting up Composer...

 \e[39m
"

mkdir -m 775 "$HOME/bin"

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    printf "Composer couldn't be installed"
else
    php composer-setup.php
    mv composer.phar "$HOME/bin/composer"
fi

rm composer-setup.php
chmod o-w -R "$HOME/.config"

# ===============================================================

# vagrant
printf "\e[35m

 Stage 4: Installing Vagrant...

 \e[39m
"

wget "https://releases.hashicorp.com/vagrant/${vagrant_version}/vagrant_${vagrant_version}_x86_64.deb"
sudo dpkg -i "vagrant_${vagrant_version}_x86_64.deb"
rm "vagrant_${vagrant_version}_x86_64.deb"

# ===============================================================

# zsh
printf "\e[35m

 Stage 5: Setting up ZSH...

 \e[39m
"

[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.old" # backup old zsh file if it exists

# unattended oh-my-zsh install
if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
fi

curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh >> ohmyzsh.sh
bash ohmyzsh.sh --unattended
chsh -s "$(which zsh)"
rm ohmyzsh.sh

# add directories to PATH
printf "\nexport PATH=\"\$HOME/bin:\$HOME/.config/composer/vendor/bin:\$PATH\"" >> "$HOME/.zshenv"

# sets up oh-my-zsh plugins/theme
sed -i 's/plugins=(git)/plugins=(git composer git-flow gulp homestead laravel node npm vagrant)/g' "$HOME/.zshrc"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="candy"/g' "$HOME/.zshrc"

# ===============================================================

# sort out guard/listen issue
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# ===============================================================

# sort out VS Code
printf "\e[34m

 Stage 6: Setting VS Code defaults

 \e[39m
"

if [ ! -f "$HOME/.config/Code/User/settings.json" ]; then
    mkdir -p "$HOME/.config/Code/User/"
    curl "https://raw.githubusercontent.com/develop-me/bootcamp--setup/master/vscode.json" > "$HOME/.config/Code/User/settings.json"
fi

# ===============================================================

# do rest of stuff that takes ages
printf "\e[35m

 Stage 7: Setting Up Vagrant

 \e[39m
"

for i in "${vagrant_plugins[@]}"
do
    vagrant plugin install "$i"
done

# ===============================================================

# add check alias
printf "\nalias weallgood=\"echo 'We all good! \\(^o^)/'\"" >> "$HOME/.zshrc"

printf "\e[35m

 —————————————————————————————————————————————————————

 And we're done!
 \e[39m
"
