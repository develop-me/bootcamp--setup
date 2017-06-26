# Setting up Windows

## Initial Setup of Bash

[Installing Bash on Windows](https://msdn.microsoft.com/en-gb/commandline/wsl/install_guide)

## Download and install

- [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html)
- [Chrome Canary](https://www.google.co.uk/chrome/browser/canary.html)
- [Slack](https://slack.com/)
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
- Check it's working: `php -v`

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
1. type `git clone git@github.com:scotch-io/scotch-box.git`
1. navigate into the new directory with `cd scotch-box`
1. Windows only: edit `Vagrantfile` and remove this line: `config.vm.hostname = "scotchbox"`
1. type `vagrant up`
1. when completed visit [192.168.33.10](http://192.168.33.10/)