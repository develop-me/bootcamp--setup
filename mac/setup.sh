#! /bin/bash

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
    virtualbox
    visual-studio-code
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

printf "\e[34m
 Ok, let's go...

 Installing homebrew...

 This is a command line tool that installs everything
 else for us. It's really handy.
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


printf "\e[34m

 Next we'll install the apps...
 \e[39m
"

sleep 2

# install apps
for i in "${apps[@]}"
do
    brew cask install "$i"
done


printf "\e[34m

 Now we'll install the command line apps
 \e[39m
"

sleep 2


# install cli tools
for i in "${cli[@]}"
do
    brew install "$i"
done

printf "\e[34m

 Next we're going to install gulp
 \e[39m
"

sleep 2

# install gulp-cli globally with npm (no homebrew cask)

npm install gulp-cli -g

printf "\e[34m

 Next we're going to download some Vagrant boxes
 \e[39m
"

sleep 2

# add vagrant boxes
for i in "${vagrant_boxes[@]}"
do
    vagrant box add "$i" --provider virtualbox
done

vagrant plugin install "${vagrant_plugins[@]}"

# restart VirtualBox as service can cause issues
sudo launchctl load /Library/LaunchDaemons/org.virtualbox.startup.plist

# zsh
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.old" # backup old zsh file if it exists
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "export PATH=/usr/local/bin:\$HOME/.bin:\$HOME/.composer/vendor/bin:\$PATH" >> "$HOME/.zshenv"

sed -i 's/plugins=(git)/plugins=(git brew cask composer git-flow gulp homestead laravel node npm vagrant vscode)/g' "$HOME/.zshrc"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="candy"/g' "$HOME/.zshrc"

# show hidden files and file extensions in Finder
defaults write com.apple.finder AppleShowAllFiles YES
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder

# add shortcut to iCloud
ln -s "$HOME/Library/Mobile Documents/com~apple~CloudDocs" "$HOME/iCloud"

printf "\e[35m

 And we're done!
 Aren't you glad you've got a Mac?
 \e[39m
"
