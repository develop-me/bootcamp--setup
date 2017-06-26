# Setting up Mac OS X

## Initial Setup of Homebrew

- Open Terminal
- Run `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Follow the instructions on screen

## Download and install

- [Photoshop](http://www.adobe.com/uk/products/photoshop.html) available as part of [Creative Cloud](https://creative.adobe.com/products/download/creative-cloud) subscription (30 day free trial)

## Install Software with Homebrew

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

Our Slack Organisation is `developme` so [developme.slack.com](https://developme.slack.com/)

Or, to run as one command:

```
brew install caskroom/cask/google-chrome caskroom/versions/google-chrome-canary caskroom/cask/slack caskroom/cask/sublime-text caskroom/cask/filezilla caskroom/cask/vagrant caskroom/cask/virtualbox git node libsass ruby homebrew/php/php70 homebrew/php/composer && gem install sass
```

## Download and create your first virtual machine

1. Navigate to your week5 Coding Fellowship folder, e.g. `cd coding-fellowship/week5`
1. download [this file](https://github.com/scotch-io/scotch-box/archive/master.zip), unzip and place files inside (`public`, `Vagrantfile`, `README.md`) inside your `week5` folder
1. type `vagrant up`
1. when completed visit [192.168.33.10](http://192.168.33.10/)