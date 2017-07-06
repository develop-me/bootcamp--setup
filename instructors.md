# Guide To Windows Setup for Instructors

The Windows setup we are now recommending involves installed "Bash for Windows" (WSL), which was added to Windows 10 in the 2016 update. All command line work for Windows should be done using WSL, as it will get students used to working with a Linux system and mean that Mac and Windows can use the same commands.

WSL installs a containerised version of Ubuntu on Windows. Although it is not a virtual machine, its use is very similar. Once WSL is setup on the machine a `bash` command is added to command prompt, which then switches over into Ubuntu.

We've recommended that Windows students use ConEmu, a terminal emulator for Windows that is much more configurable than the default Bash terminal and allows features like copy and paste. It's possible to set ConEmu to boot straight into Bash mode.

## Usage

Once in Bash, you are running in a real Linux environment, so all of the standard unix-style commands are available: `cd`, `ls`, etc.

To install packages you can use `sudo apt-get install`, just as you would on an Ubuntu box.

We hope that we've already installed all the packages that will be needed. If you require other packages, please let Mark know so that he can add them to the setup script.

### Installed Packages

- Git
- Ruby & Sass
- Node
- PHP & Composer

### Vagrant

Vagrant in WSL is clever enough to link through to the underlying version of Vagrant for Windows. So you should be able to run all vagrant commands in ConEmu and it will run as if running from command prompt.

### File System

The `C:` drive is mounted at `/mnt/c`, so you'll want to make sure that Windows students are in the right directory, something like `/mnt/c/Users/<username>/Documents/coding-fellowship`. If they work outside of the `/mnt/c` their files will be stuck inside the Linux container.

---

## Issues

If you have any issues then get in touch with Mark (smallhadroncollider) on Slack. It's all a bit beta at the moment, so we'd expect a few teething issues.
