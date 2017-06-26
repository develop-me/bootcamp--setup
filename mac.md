# Setting up Mac OS X

## Initial Setup of Homebrew

- Open Terminal
- Run `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Follow the instructions on screen

## Install Software

- Chrome: `brew install caskroom/cask/google-chrome`
- Chrome Canary: `brew install caskroom/versions/google-chrome-canary`
- Slack: `brew install caskroom/cask/slack`
- Sublime 3: `brew install caskroom/cask/sublime-text`
- FileZilla: `brew install caskroom/cask/filezilla`
- Vagrant: `brew install caskroom/cask/vagrant`
- Virtualbox: `brew install caskroom/cask/virtualbox`
- Git: `brew install git`
- Node: `brew install node`
- Sass: `brew install libsass ruby && gem install sass` 
- Composer: `brew install homebrew/php/php70 homebrew/php/composer`

Or, to run as one command:

```
brew install caskroom/cask/google-chrome caskroom/versions/google-chrome-canary caskroom/cask/slack caskroom/cask/sublime-text caskroom/cask/filezilla caskroom/cask/vagrant caskroom/cask/virtualbox git node libsass ruby homebrew/php/php70 homebrew/php/composer && gem install sass
```

## Download and create your first virtual machine

1. Navigate to your week5 Coding Fellowship folder, e.g. `cd coding-fellowship/week5`
1. type `git clone git@github.com:scotch-io/scotch-box.git`
1. navigate into the new directory with `scotch-box`
1. Windows only: edit `Vagrantfile` and remove this line: `config.vm.hostname = "scotchbox"`
1. type `vagrant up`
1. when completed visit [192.168.33.10](http://192.168.33.10/)