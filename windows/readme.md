# Setting up Windows

## Initial Setup of Bash

[Installing Bash on Windows](https://msdn.microsoft.com/en-gb/commandline/wsl/install_guide)

*NOTE* make sure when it asks you to set a username and password you do (you won't see the password typing characters but it will be recording your entry).

If you see root@... in the window title bar then stop and ask for help.

## Download and install

- [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html)
- [Chrome Canary](https://www.google.co.uk/chrome/browser/canary.html)
- [Slack](https://slack.com/) our Slack Organisation is `developme` so [developme.slack.com](https://developme.slack.com/)
- [Sublime 3](https://www.sublimetext.com/3)
- [FileZilla](https://filezilla-project.org/download.php?show_all=1)
- [Photoshop](http://www.adobe.com/uk/products/photoshop.html) available as part of [Creative Cloud](https://creative.adobe.com/products/download/creative-cloud) subscription (30 day free trial)
- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)

## Install ConEmu

- Download and install [https://conemu.github.io](https://conemu.github.io)
- When it first loads select the {Bash::bash} as the startup task
- Use ConEmu for all command line work 

## Installing Programs with bash / command line (ConEmu)

Run all of these in ConEmu:

### Git

- Run `sudo apt-get install git`
- Check it's working `git --version`

### PHP

- Run `sudo apt-get install php7.0`
- Check it's working: `php -v` you should see something like `PHP 7.x.x (cli)`

### Composer

Run the following commands:

```
cd ~
mkdir bin
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
rm composer-setup.php
cp composer.phar bin/composer
source .profile
```

Check it's working:

```
composer
```

### Node

Run the following commands:

```
cd ~
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs
```

Check it's working: `node -v`

### Ruby

Run the following commands:

```
sudo apt-get install ruby
sudo gem install sass
```

## Using Command Line

Make sure you run `cd /mnt/c/Users/yourusername` when you first go into command line - this will ensure that you're in the right directory

## Download and create your first virtual machine

1. Navigate to your week5 Coding Fellowship folder, e.g. `cd coding-fellowship/week5`
1. download [this file](https://github.com/scotch-io/scotch-box/archive/master.zip), unzip and place files inside (`public`, `Vagrantfile`, `README.md`) inside your `week5` folder
1. edit `Vagrantfile` and remove this line: `config.vm.hostname = "scotchbox"`
1. type `vagrant up`
1. when completed visit [192.168.33.10](http://192.168.33.10/)