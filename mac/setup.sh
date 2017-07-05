#! /bin/bash

# ===================================================

# If you update this list, don't forget to update the
# descriptions below

apps=(
    caskroom/cask/google-chrome
    caskroom/versions/google-chrome-canary
    caskroom/cask/slack
    caskroom/cask/sublime-text
    caskroom/cask/filezilla
    caskroom/cask/vagrant
    caskroom/cask/virtualbox
    caskroom/cask/iterm2
)

cli=(
    wget
    git
    node
    libsass 
    ruby
    homebrew/php/php70
    homebrew/php/composer
)

gems=(
    sass
)

vagrant_boxes=(
    scotch/box
    laravel/homestead
)

vagrant_plugins=(
    vagrant-vbguest
    vagrant-hostsupdater
)

sublime_plugins='[
    "Laravel Blade Highlighter"
]'


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
 Mac Setup Script v1.0

 —————————————————————————————————————————————————————

 This will install the following apps:

 • Chrome: a web developer's best friend 
 • Chrome Canary: a web developer's unstable friend 
 • Slack: communication is important 
 • Sublime Text 3: text editor of choice 
 • FileZilla: old-skool file transfer 
 • Vagrant: for running development environments 
 • Virtualbox: helps Vagrant out 
 • iTerm2: a nicer terminal 


 It will also install the following command line tools:

 • Git: version control made simple(ish)
 • Node: JavaScript on the command line 
 • Sass: makes CSS betterer 
 • Composer: installs all the PHP things 

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


printf "\e[34m

 Next we'll install the apps...
 \e[39m
"

sleep 2

# install apps
for i in "${apps[@]}"
do
    brew install "$i"
done


printf "\e[34m

 Finally, we'll install the command line apps 
 \e[39m
"

sleep 2


# install cli tools
for i in "${cli[@]}"
do
    brew install "$i"
done

# install gems
gem install "${gems[@]}"

# add vagrant boxes
for i in "${vagrant_boxes[@]}"
do
    vagrant box add "$i" --provider virtualbox
done

vagrant plugin install "${vagrant_plugins[@]}"

# setup Sublime Text command line
mkdir -p ~/.bin
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/.bin/subl" ~/bin/subl

# setup Sublime Text plugins
stpath="$HOME/Library/Application Support/Sublime Text 3"

if [ ! -f "$stpath/Installed Packages/Package Control.sublime-package" ]; then
    mkdir -p "$stpath/Installed Packages" 
    mkdir -p "$stpath/Packages/User" 
    wget https://packagecontrol.io/Package%20Control.sublime-package -P "$stpath/Installed Packages"
    echo "{\"installed_packages\": ${sublime_plugins}}" > "$stpath/Packages/User/Package Control.sublime-settings"
fi

# setup bash profile
echo "export PATH=$HOME/.bin:$HOME/.composer/vendor/bin:$PATH" >> ~/.bashrc

printf "\e[35m

 And we're done!
 Aren't you glad you've got a Mac?
 \e[39m
"
