# Computer filesystems, file paths and navigation

Understanding how to get to and link to files on a computer is an essential skill for web development, e.g. how to pull that image into your web page, or link out to your stylesheet.

However, it is also important to know how to navigate around your computer's files using terminal (also referred to as command line, shell or bash).

Having this skill will enable you to quickly move to where you need to get to, execute commands and achieve your task.

## LAMP stack: Linux, Apache, MySQL, PHP

TODO: why using unix/linux-style on the course is best


## The difference between Windows and Unix-like filesystems (Mac OS X, Linux, etc.)

TODO

### Windows: C:

An example folder structure on a Windows machine:

```
+-- C: (root of file system, your main harddrive)
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

You can check 

## Absolute vs. relative paths

TODO

## Your home folder

TODO


### Windows

If using bash for Windows or ConEmu your home directory is at: `/mnt/c/Users/YOURUSERNAME/`

## How other harddrives show up on your filesystem

### Windows

TODO

### Mac

TODO