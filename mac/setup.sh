#! /bin/bash

# stop on first error
set -e

# ===================================================

# If you update this list, don't forget to update the
# descriptions below

apps=(
    google-chrome
    slack
    cyberduck
    firefox
    sequel-pro
    vagrant
    visual-studio-code
    virtualbox
)

cli=(
    wget
    git
    node
    libsass
    sass/sass/sass
    ruby
    watchman
    php
    composer
    zsh
)

vagrant_boxes=(
    scotch/box
    laravel/homestead
)

vagrant_plugins=(
    vagrant-vbguest
    vagrant-hostsupdater
)


# ===================================================

clear

printf "\e[35m
  ____                 _             __  __
 |  _ \  _____   _____| | ___  _ __ |  \/  | ___
 | | | |/ _ \ \ / / _ \ |/ _ \| '_ \| |\/| |/ _ \
 | |_| |  __/\ V /  __/ | (_) | |_) | |  | |  __/
 |____/ \___| \_/ \___|_|\___/| .__/|_|  |_|\___|____
                              |_|              |_____|
 \e[32m
 Mac Setup Script

 —————————————————————————————————————————————————————

 This will install the following apps:

 • Firefox: a web developer's best friend
 • Chrome: for ChromeCast
 • Slack: communication is important
 • VS Code: text editor of choice
 • CyberDuck: old-skool file transfer
 • Vagrant: for running development environments
 • Virtualbox: helps Vagrant out
 • iTerm2: a nicer terminal


 It will also install the following command line tools:

 • Git: version control made simple(ish)
 • Node: JavaScript on the command line
 • Sass: makes CSS betterer
 • Composer: installs all the PHP things
 • ZSH: a nicer command-line experience

 —————————————————————————————————————————————————————

 During this process you may be asked to enter your
 password. This is just so it can put files in the
 right places. Don't worry, it's not stored anywhere.


 Ready? (y/n) \e[39m"

read -r input

if ([ "$input" == "no" ] || [ "$input" == "n" ]); then
    exit 1
fi

# ===============================================================

# homebrew
printf "\e[34m

 Ok, let's go...

 Stage 1: Installing Homebrew...

 (This is a command line tool that installs everything
 else for us. It's really handy.)

 \e[39m
"

# homebrew install script
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# check that permissions on the homebrew directory are ok
# can be broken if multiple users on same mac
if [ -w "$(brew --prefix)/bin" ];
    then : ;
    else
        printf "\e[31m

 Sorry, the permissions on /usr/local are all wonky
 Please seek help from an instructor
 \e[39m
"

        exit;
fi

# ===============================================================

# casks
printf "\e[34m

 Stage 2: Installing apps...

 \e[39m
"

# install apps
for i in "${apps[@]}"
do
    if ! brew cask ls "$i" 2> /dev/null; then
        brew cask install --force "$i"
    fi
done

# restart VirtualBox as service can cause issues
sudo launchctl load /Library/LaunchDaemons/org.virtualbox.startup.plist

# ===============================================================

# cli tools
printf "\e[34m

 Stage 3: Installing command-line tools...

 \e[39m
"

# install cli tools
for i in "${cli[@]}"
do
    if ! brew ls "$i" 2> /dev/null; then
        brew install "$i"
    fi
done

# ===============================================================

# gulp
printf "\e[34m

 Stage 4: Installing gulp...

 \e[39m
"

# install gulp-cli globally with npm (no homebrew cask)
npm install gulp-cli -g

# ===============================================================

# zsh
printf "\e[34m

 Stage 5: Setting up ZSH...

 \e[39m
"

[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.old" # backup old zsh file if it exists

# unattended oh-my-zsh install
curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh >> ohmyzsh.sh
bash ohmyzsh.sh --unattended
chsh -s "$(which zsh)"
rm ohmyzsh.sh

echo "export PATH=/usr/local/bin:\$HOME/.bin:\$HOME/.composer/vendor/bin:\$PATH" >> "$HOME/.zshenv"

sed -i '.original' -e 's/plugins=(git)/plugins=(git brew cask composer git-flow gulp homestead laravel node npm vagrant vscode)/g' "$HOME/.zshrc"
sed -i '.original' -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="candy"/g' "$HOME/.zshrc"

rm "$HOME/.zshrc.original"

# ===============================================================

printf "\e[34m

 Stage 6: Configuring Finder...

 \e[39m
"

# show hidden files and file extensions in Finder
defaults write com.apple.finder AppleShowAllFiles YES
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder

# add shortcut to iCloud
ln -s "$HOME/Library/Mobile Documents/com~apple~CloudDocs" "$HOME/iCloud"

# ===============================================================

# sort out VS Code
printf "\e[34m

 Stage 7: Setting VS Code defaults

 \e[39m
"

if [ ! -f "$HOME/Library/Application Support/Code/User/settings.json" ]; then
    mkdir -p "$HOME/Library/Application Support/Code/User/"
    curl "https://raw.githubusercontent.com/develop-me/bootcamp--setup/master/vscode.json" > "$HOME/Library/Application Support/Code/User/settings.json"
fi


# ===============================================================

# add check alias
printf "\nalias weallgood=\"echo 'We all good 👍'\"" >> "$HOME/.zshrc"

# ===============================================================

# do rest of vagrant stuff that takes ages
printf "\e[34m

 Stage 8: Downloading Vagrant boxes
 (This part can take a while and isn't essential)

 \e[39m
"

vagrant plugin install "${vagrant_plugins[@]}"

# add vagrant boxes
for i in "${vagrant_boxes[@]}"
do
    vagrant box add "$i" --provider virtualbox
done

# ===============================================================

# remove setup script
rm setup.sh

# ===============================================================

printf "\e[35m

 And we're done!
 \e[39m
"
