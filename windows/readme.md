# Setting up Windows

**Make sure you're running the latest version of Windows 10. If you are not then be sure to run the latest updates and restart your machine. If you do not do this some of the steps below may not work.**

## Download and install

- [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html)
- [Chrome Canary](https://www.google.co.uk/chrome/browser/canary.html)
- [Slack](https://slack.com/) our Slack Organisation is `developme` so [developme.slack.com](https://developme.slack.com/)
- [Sublime 3](https://www.sublimetext.com/3)
- [FileZilla](https://filezilla-project.org/download.php?show_all=1)
- [Photoshop](http://www.adobe.com/uk/products/photoshop.html) available as part of [Creative Cloud](https://creative.adobe.com/products/download/creative-cloud) subscription (30 day free trial)
- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)
- [ConEmu](https://conemu.github.io)


## Setting up Bash for Windows 

**Make sure that Vagrant and ConEmu are installed before continuing.**

- Type "developers" into the search bar, then click on the "For developers settings option"
- In the window that appears select "Developer Mode", then click on "Yes" when prompted
- Type "windows features" into the search bar, then click on "Turn Windows features on or off"
- In the window that appears tick the box named "Windows Subsystem for Linux (Beta)", then click on "OK"
- Restart your computer

After your computer has restarted:

- Open ConEmu
- When ConEmu first loads select {Bash::bash} as the startup task
- When prompted, type `y` to agree to the Ubuntu T&Cs
- When prompted, type `y` to set the locale
- When prompted, enter a username: this should be all lowercase with no spaces
- When prompted, enter a password: you'll have to type this quite a lot, so pick something memorable (don't worry if it doesn't look like you're typing anything, this is for security)


## Installing command line tools

[Click here to download the `setup.sh` file](https://cdn.rawgit.com/develop-me/setup/854dabf4f186c60463d53af8de0622638fb058c6/windows/setup.sh) and save it to your Downloads directory (e.g. `C:\Users\yourusername\Downloads`). Next, in ConEmu app, run the following (replace `yourusername` with your Windows username):

```
/mnt/c/Users/yourusername/Downloads/setup.sh && source ~/.profile
```

Once the setup is complete you can delete the `setup.sh` file.
