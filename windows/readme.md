# Setting up Windows

## Download and install

- [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html)
- [Chrome Canary](https://www.google.co.uk/chrome/browser/canary.html)
- [Slack](https://slack.com/) our Slack Organisation is `developme` so [developme.slack.com](https://developme.slack.com/)
- [Sublime 3](https://www.sublimetext.com/3)
- [FileZilla](https://filezilla-project.org/download.php?show_all=1)
- [Photoshop](http://www.adobe.com/uk/products/photoshop.html) available as part of [Creative Cloud](https://creative.adobe.com/products/download/creative-cloud) subscription (30 day free trial)
- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)


## Setting up Bash for Windows 

**Make sure you're running the latest version of Windows 10. If you are not then be sure to run the latest updates and restart your machine. If you do not do this some of the steps below may not work.**

- Type "developers" into the search bar, then click on the "For developers settings option"
- In the window that appears select "Developer Mode", then click on "Yes" when prompted
- Type "windows features" into the search bar, then click on "Turn Windows features on or off"
- In the window that appears tick the box named "Windows Subsystem for Linux (Beta)", then click on "OK"
- Restart your computer

## Setting up ConEmu 

- Download and install [https://conemu.github.io](https://conemu.github.io)
- When ConEmu first loads select {Bash::bash} as the startup task
- When prompted, type `y` to agree to the Ubuntu T&Cs
- When prompted, type `y` to set the locale
- When prompted, enter a username: this should be all lowercase with no spaces
- When prompted, enter a password: you'll have to type this quite a lot, so pick something memorable (don't worry if it doesn't look like you're typing anything, this is for security)


## Installing command line tools

Download the [`setup.sh`](https://raw.githubusercontent.com/develop-me/setup/master/windows/setup.sh) file and save it to your Downloads directory (e.g. `C:\Users\yourusername\Downloads`). Next, in ConEmu app, run the following (replace `yourusername` with your Windows username):

```
/mnt/c/Users/yourusername/Downloads/setup.sh && source ~/.profile
```

Once the setup is complete you can delete the `setup.sh` file.

## Download and create your first virtual machine

1. Navigate to your week5 Coding Fellowship folder, e.g. `cd coding-fellowship/week5`
2. download [this file](https://github.com/scotch-io/scotch-box/archive/master.zip), unzip and place files inside (`public`, `Vagrantfile`, `README.md`) inside your `week5` folder
3. edit `Vagrantfile` and remove this line: `config.vm.hostname = "scotchbox"`
4. type `vagrant up`
5. when completed visit [192.168.33.10](http://192.168.33.10/)
