# Computer filesystems, file paths and navigation

Understanding how to get to and link to files on a computer is an essential skill for web development, e.g. how to pull that image into your web page, or link out to your stylesheet.

However, it is also important to know how to navigate around your computer's files using terminal (also referred to as command line, shell or bash).

Having this skill will enable you to quickly move to where you need to get to, execute commands and achieve your task.

## LAMP stack: Linux, Apache, MySQL, PHP

On the Coding Fellowship we teach PHP as our back-end technology.

PHP websites and applications commonly run on a hosting environment known as LAMP, due to running *L*inux as the operating system, *A*pache as the web server, *M*ySQL as the database system and *P*HP as the dynamic scripting language.

66.5% of websites on the internet run on Unix/Linux servers.

For this reason an understanding of how paths on Unix/Linux systems work is essential.

## The difference between Windows and Unix-like filesystems (Mac OS X, Linux, etc.)

Linux is a Unix-like operating system, and Mac OS X is built on Unix too.

For this reason Unix, Linux and OS X share a common file path approach, the way the operating system represents the location of files and folders, with forwardslashes `/` separating folder names, e.g. `Documents/Invoices`, and the root or base of the operating system being represented `/`.

Windows has a different file path approach, with folder names separated by backslashes `\`, and the base of the operating system's hard drive being commonly represented by `C:\` (the C drive).

### Windows: C:

An example folder structure on a Windows machine:

```
+-- C: (root of file system, your main hard drive)
|   +-- Program Files
|   +-- Users
|   |   +-- YOURUSERNAME
|   |   |   +-- Desktop
|   |   |   +-- Documents
|   |   |   +-- Downloads
|   +-- Windows
```

A Windows path to your user folder if you are using cmd (Windows' command line program) might be:

`c:\Users\YOURUSERNAME`

If you are using Bash for Windows or ConEmu then the paths are Unix-style and might be:

`/mnt/c/Users/YOURUSERNAME/`

NOTE: we recommend Windows users use Bash for Windows or ConEmu to give consistency and build familiarity with Unix-style filesystems.

### Mac: /

```
+-- / (root of file system)
|   +-- Applications
|   +-- Library
|   +-- System
|   +-- Users
|   |   +-- Guest
|   |   +-- Shared
|   |   +-- YOURUSERNAME
|   |   |   +-- Desktop
|   |   |   +-- Documents
|   |   |   +-- Downloads
|   |   |   +-- Movies
|   |   |   +-- Music
|   |   |   +-- Pictures
```

## Navigating around your filesystem

The key tool when navigating the filesystem is the `cd` command, which enables you to change directory.

An example folder for a web project might have this structure:

```
+-- my-website
|   +-- css
|   +-- images
|   +-- index.html
```

To navigate from the `my-website` folder into the `css` folder you might use the command:

`cd css`

To get back to the `my-website` folder (going back "up" the tree) you might run:

`cd ..`

You can check your current location in the filesystem with `pwd` (print working directory).

### Structuring your projects

On the command line case matters: `cd documents` is different from `cd Documents`, so you'll need to remember if the folder/file has any capital letters in it or not.

Spaces cause issues because when the command line sees a space it assumes it is another part of the command, e.g. `cd Documents/My Directory` is seen as `cd Documents/My` followed by a second command (and `cd` only accepts one). You can avoid this by surrounding the argument in quotation marks: `cd "Documents/My Directory"`

However, you can avoid having to think about these issues by using a simple naming convention: always user lowercase and use hyphens instead of spaces. This will mean you never have to worry about using quotation marks or whether you used a capital letter or not.

When we get to Laravel at the end of the course you'll see that sometimes we *have* to use mixed-case naming for our code to work, but you should never need to have spaces in your filenames.

## Absolute vs. relative paths

Given a Unix file system:

```
+-- / (root of file system)
|   +-- Websites
|   |   +-- portfolio-website
|   |   |   +-- css
|   |   |   |   +-- stylesheet.css
|   |   |   +-- images
|   |   |   |   +-- logo.png
|   |   |   +-- index.html
```

The full path to the homepage `index.html` file would be `/Websites/portfolio-website/index.html` and you could load it in your browser at the address `file:///Websites/portfolio-website/index.html`.

If you wanted to pull in your stylesheet you could use:

```
<link rel="stylesheet" href="css/stylesheet.css">
```

This would cause the browser to look in the `css` folder, that is in the same directory as `index.html`, to find a file called `stylesheet.css`.

If you wanted to reference you `logo.png` file from the stylesheet you could use the absolute path to it, e.g.:

```
header {
  background-image: url(/Websites/portfolio-website/images/logo.png);
}
```

Or you could use the relative path, using the stylesheet as a starting point you'd need to go back 'up' the tree from the `css` folder with `../` before going back down into the `images` folder:

```
header {
  background-image: url(../images/logo.png);
}
```

### Advantages of relative path

If you were to rename your website's folder from `portfolio-website` to `my-website` then the absolute path method would break! As we used:

```
header {
  background-image: url(/Websites/portfolio-website/images/logo.png);
}
```

And the folder is no longer called `portfolio-website`.

But, if we used the relative path, then everything would work fine.

## Your home folder

Your user account on your computer has a home directory, which is protected and only accessibly by your account.

This is commonly where your Documents, Music, Pictures, etc. folders are.

There is a Unix-style shortcut to getting to your homefolder, which has the alias `~`, so, you could type `cd ~/Documents` to get to the `Documents` folder in your user directory quickly.

## How other harddrives show up on your filesystem

### Windows

If you're using Bash/ConEmu then your other Windows drives, if you have any, will appear in the `/mnt` directory. For example, say you had a secondary `D:` drive, this would located at `/mnt/d`

### Mac

On Mac your other drives, if you have any, will appear in the `/Volumes` directory. For example, say you had a secondary "Backups", this would be located at `/Volumes/Backups`
