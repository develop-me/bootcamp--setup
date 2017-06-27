# Setting up Windows

## Initial Setup of Bash

**Make sure you're running the latest version of Windows 10. If you are not then be sure to run the latest updates and restart your machine. If you do not do this some of the steps below may not work.**

[Installing Bash on Windows](https://msdn.microsoft.com/en-gb/commandline/wsl/install_guide)

**NOTE:** Make sure when it asks you to set a username and password you do (you won't see the password typing characters but it will be recording your entry).

## Install ConEmu

- Download and install [https://conemu.github.io](https://conemu.github.io)
- When it first loads select the {Bash::bash} as the startup task
- Use ConEmu for all command line work 

## Install Command Line Apps

Download the [`setup.sh`](https://raw.githubusercontent.com/develop-me/setup/master/windows/setup.sh) file and save it to your home directory (e.g. `C:\Users\yourname`). Next open the ConEmu app and run the following:

```
/mnt/c/Users/yourname/setup.sh
```

Once the setup is complete you can delete the file.

## Download and install

- [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html)
- [Chrome Canary](https://www.google.co.uk/chrome/browser/canary.html)
- [Slack](https://slack.com/) our Slack Organisation is `developme` so [developme.slack.com](https://developme.slack.com/)
- [Sublime 3](https://www.sublimetext.com/3)
- [FileZilla](https://filezilla-project.org/download.php?show_all=1)
- [Photoshop](http://www.adobe.com/uk/products/photoshop.html) available as part of [Creative Cloud](https://creative.adobe.com/products/download/creative-cloud) subscription (30 day free trial)
- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)


## Download and create your first virtual machine

1. Navigate to your week5 Coding Fellowship folder, e.g. `cd coding-fellowship/week5`
2. download [this file](https://github.com/scotch-io/scotch-box/archive/master.zip), unzip and place files inside (`public`, `Vagrantfile`, `README.md`) inside your `week5` folder
3. edit `Vagrantfile` and remove this line: `config.vm.hostname = "scotchbox"`
4. type `vagrant up`
5. when completed visit [192.168.33.10](http://192.168.33.10/)
