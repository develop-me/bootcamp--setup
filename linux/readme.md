# Setting up Ubuntu

**Make sure you're running the latest version of Ubuntu. If you are not then be sure to run the latest updates and restart your machine. If you do not do this some of the steps below may not work. You should *always* keep your operating system and software up to date.**

If you're running a different distribution of Linux, let us know and we'll panic a bit and then try and get something working.


## Virgin Broadband

If you're using Virgin Broadband you will need to [disable "Virus Safe"](https://my.virginmedia.com/my-apps/onlinesecurity/websafe/settings) before running the setup script. Unfortunately they're a bit over-zealous and block *all* GitHub traffic, which probably stops one or two bits of malicious code, but also stops all of the code that we need!


## Download and install

- [Firefox](https://www.mozilla.org/firefox)
- [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html): for using ChromeCast
- [Slack](https://slack.com/) our Slack Organisation is `developme` so [developme.slack.com](https://developme.slack.com/)
- [VS Code](https://code.visualstudio.com)
- [FileZilla](https://filezilla-project.org/download.php?show_all=1)

## Installing command line tools

- Load Terminal
- Run:

    ```bash
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/develop-me/bootcamp--setup/master/linux/setup.sh)"
    ```

    At various points you'll be asked for your password – this is necessary to install certain apps outside of your home directory.

    **When you enter a password on the command-line it won't look like you're typing anything, but you are. Press Enter when you're done.**

- You should see "And we're done!" at the end if everything has worked

- Close Terminal

- Re-open Terminal and type in `weallgood`. You should get a "We all good!" message in response.


## Set up a GitHub account

You can [sign up here](https://github.com/join) (the free plan is fine).

Then re-open Terminal and run through the [Tooling Choose Your Own Adventure Guide](https://github.com/develop-me/bootcamp--week-05--tooling/blob/master/challenges/00/05-ssh-authentication.md)
