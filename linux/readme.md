# Setting up Ubuntu

**Make sure you're running the latest version of Ubuntu. If you are not then be sure to run the latest updates and restart your machine. If you do not do this some of the steps below may not work. You should *always* keep your operating system and software up to date.**

If you're running a different distribution of Linux, let us know and we'll panic a bit and then try and get something working.

## Download and install

- [Firefox](https://www.mozilla.org/firefox)
- [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html): for using ChromeCast
- [Slack](https://slack.com/) our Slack Organisation is `developme` so [developme.slack.com](https://developme.slack.com/)
- [Krita](https://krita.org/en/) for PSD editing
- [VS Code](https://code.visualstudio.com)
- [FileZilla](https://filezilla-project.org/download.php?show_all=1)
- [Virtualbox](https://www.virtualbox.org/)

## Set up a GitHub account

You can [sign up here](https://github.com/join) (the free plan is fine).

## Installing command line tools

[Click here to download the `setup.sh` file](https://cdn.rawgit.com/develop-me/setup/c34c0cf5c70efa6bec4189e23662cde357ec5145/linux/setup.sh) and save it to your Downloads directory (e.g. `~/Downloads`). Next, in Terminal, run the following:

```
bash ~/Downloads/setup.sh && source ~/.bashrc && exit
```

The tab should close itself when it's done. Once that happens you can delete the `setup.sh` file.
