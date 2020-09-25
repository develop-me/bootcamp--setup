# Setting up Mac OS X

**Make sure you're running the latest version of macOS. If you are not then be sure to run the latest updates and restart your machine. If you do not do this some of the steps below may not work. You should *always* keep your operating system and software up to date.**


## Virgin Broadband

If you're using Virgin Broadband you will need to [disable "Virus Safe"](https://my.virginmedia.com/my-apps/onlinesecurity/websafe/settings) before running the setup script. Unfortunately they're a bit over-zealous and block *all* GitHub traffic, which probably stops one or two bits of malicious code, but also stops all of the code that we need!


## VirtualBox

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (Click on "OS X Hosts")
- Go into "Security & Privacy" in System Preferences and make sure you allow the VirtualBox kernel extension.

## Automatic Install

- Load Terminal
- Run:

    ```bash
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/develop-me/bootcamp--setup/master/mac/setup.sh)"
    ```

- You should see "And we're done!" at the end if everything has worked

- Close Terminal

- Re-open Terminal and type in `weallgood`. You should get a "We all good!" message in response.


## Set up a GitHub account

You can [sign up here](https://github.com/join) (the free plan is fine).

Then re-open Terminal and run through the [Tooling Choose Your Own Adventure Guide](https://github.com/develop-me/bootcamp--week-05--tooling/blob/master/challenges/00/05-ssh-authentication.md)
