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
)

cli=(
    wget
    git
    node
    libsass
    ruby
    watchman
    php
    composer
    zsh
)

npm=(
    grunt-cli
    sass
)

vagrant_plugins=(
    vagrant-vbguest
    vagrant-hostsupdater
)

brew_dirs=(
    bin
    etc
    include
    lib
    opt
    sbin
    share
    var
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

 \e[39m
"

if which brew &> /dev/null; then
    printf "\e[34m Stage 1: Updating Homebrew...  \e[39m"
    brew update
else
    printf "\e[34m Stage 1:  Installing Homebrew...  \e[39m"
    # homebrew install script
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    # make sure current user has permissions on relevant directories
    for i in "${brew_dirs[@]}"
    do
        if [ -d "$(brew --prefix)/${i}" ]; then
            sudo chown -R "$USER":admin "$(brew --prefix)/${i}"
        fi
    done
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
    if ! brew cask ls "$i" &> /dev/null; then
        brew cask install --force "$i"
    fi
done


# ===============================================================

# cli tools
printf "\e[34m

 Stage 3: Installing command-line tools...

 \e[39m
"

# install cli tools
for i in "${cli[@]}"
do
    if ! brew ls "$i" &> /dev/null; then
        brew install "$i"
    fi
done

# make git log more usable
git config --global --replace-all core.pager "less -iXFR"

# ===============================================================

printf "\e[34m

 Stage 4: Installing NPM packages...

 \e[39m
"

# install npm packages
for i in "${npm[@]}"
do
    npm install -g "$i"
done

# ===============================================================

# zsh
printf "\e[34m

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
rm ohmyzsh.sh

# change to brew zsh
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s "$(which zsh)"

# sort out permissions on zsh directory
chmod -R g-w /usr/local/share/zsh

# find path for brew installed gems
GEM_PATH=$(/usr/local/opt/ruby/bin/gem env GEM_PATH)

echo "export PATH=/usr/local/bin:\$HOME/.bin:\$HOME/.composer/vendor/bin:/usr/local/opt/ruby/bin:$GEM_PATH:\$PATH" >> "$HOME/.zprofile"

sed -i '.original' -e 's/plugins=(git)/plugins=(git brew composer git-flow gulp homestead laravel node npm vagrant vscode)/g' "$HOME/.zshrc"
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

# do rest of vagrant stuff that takes ages
printf "\e[34m

 Stage 8: Setting Up Vagrant

 \e[39m
"

for i in "${vagrant_plugins[@]}"
do
    vagrant plugin install "$i"
done


# ===============================================================

# add check alias
printf "\nalias weallgood=\"echo 'We all good 👍'\"" >> "$HOME/.zshrc"

# remove setup script
rm setup.sh

# ===============================================================

printf "\e[35m

 And we're done!
 \e[39m
"
