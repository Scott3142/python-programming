author: Scott Morgan
summary: Setting up git and virtual environments
id: getting-started
categories: btec-unit4
environments: Web
status: Published
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Getting Started

## The command line
Duration: 00:30:00

If you've never used the command line before, it can be quite daunting but once you get used to it you'll wonder how you ever worked without it.

The terminal (or 'command-line') on a computer allows a user a great deal of control over their system. Users of Windows may already have come across Command Prompt or Powershell and Mac OS users may be familiar with Terminal. All of these tools allow a user to directly manipulate their system through the use of commands. These commands can be chained together and/or combined together into complex scripts that can potentially complete tasks more efficiently than much larger traditional software packages.

The following is adapted from [these Raspberry Pi foundation resources](https://www.raspberrypi.org/documentation/).

### The terminal in Linux

If you are using the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10), open it according to the instructions contained on that page, otherwise search for `Terminal` in your installed software and open it. You should be greeted with a command prompt that looks something like:

```bash
username@hostname ~ $
```

This shows your username and the hostname of the machine you are working on.

Now, let's try running a command. Type `pwd` (present working directory) followed by the Enter key. This should display something like `/home/username`.

One of the key aspects of using a terminal is being able to navigate your file system. Firstly, run the following command: `ls -la`. You should see a list of files and folders.

The `ls` command lists the contents of the directory that you are currently in (your present working directory). The `-la` component of the command is what's known as a 'flag'. Flags modify the command that's being run. In this case the `l` displays the contents of the directory in a list, showing data such as their sizes and when they were last edited, and the a displays all files, including those beginning with a ., known as 'dotfiles'. Dotfiles usually act as configuration files for software and as they are written in text, they can be modified by simply editing them.

In order to navigate to other directories the change directory command, `cd`, can be used. You can specify the directory that you want to go to by either the 'absolute' or the 'relative' path. So if you wanted to navigate to the `Downloads` directory, you could either do `cd /home/username/Downloads` or just `cd Downloads` (if you are currently in `/home/username`). There are some special cases that may be useful: `~` acts as an alias for your home directory, so `~/Downloads` is the same as `/home/username/Downloads`; `.` and `..` are aliases for the current directory and the parent directory respectively, e.g. if you were in `/home/username/Downloads`, cd .. would take you to `/home/username`.

### History and auto-complete

Rather than type every command, the terminal allows you to scroll through previous commands that you've run by pressing the `up` or `down` keys on your keyboard. If you are writing the name of a file or directory as part of a command then pressing `tab` will attempt to auto-complete the name of what you are typing. For example, if you have a file in a directory called `aLongFileName` then pressing tab after typing `a` will allow you to choose from all file and directory names beginning with `a` in the current directory, allowing you to choose `aLongFileName`.

### Sudo

The Linux operating system is a multi-user operating system which allows multiple users to log in and use the computer. To protect the computer (and the privacy of other users), the users' abilities are restricted.

Most users are allowed to run most programs, and to save and edit files stored in their own home folder. Normal users are not normally allowed to edit files in other users' folders or any of the system files. There's a special user in Linux known as the **superuser**, which is usually given the username `root`. The superuser has unrestricted access to the computer and can do almost anything.

### sudo

You won't normally log into the computer as `root`, but you can use the `sudo` command to provide access as the superuser. If you log into your computer as `username`, then you're logging in as a normal user. You can run commands as the `root` user by using the `sudo` command before the program you want to run.

For example, if you want to install additional software on Raspbian then you normally use the `apt` tool. To update the list of available software, you need to prefix the `apt` command with sudo:

`sudo apt update`

You can also run a superuser shell by using `sudo su`. When running commands as a superuser there's nothing to protect against mistakes that could damage the system. It's recommended that you only run commands as the superuser when required, and to exit a superuser shell when it's no longer needed.

### Who can use sudo?

It would defeat the point of the security if anyone could just put `sudo` in front of their commands, so only approved users can use `sudo` to gain administrator privileges. The `username` user is included in the `sudoers` file of approved users. To allow other users to act as a superuser you can add the user to the `sudo` group with `usermod`, edit the `/etc/sudoers` file, or add them using `visudo`.

### Installing software using apt

You can use the `apt` command to install software in Raspbian. This is the 'package manager' that is included with any Debian-based Linux distributions (including Raspbian). It allows you to install and manage new software packages on your Pi. In order to install a new package, you would type `sudo apt install <package-name>` (where `<package-name>` is the package that you want to install). Running `sudo apt update` will update a list of software packages that are available on your system. If a new version of a package is available, then `sudo apt full-upgrade` will update any old packages to the new version. Finally, `sudo apt remove <package-name>` removes or uninstalls a package from your system.

### Other useful commands

There are a few other commands that you may find useful, these are listed below:

### ls

The `ls` command lists the content of the current directory (or one that is specified). It can be used with the `-l` flag to display additional information (permissions, owner, group, size, date and timestamp of last edit) about each file and directory in a list format. The `-a` flag allows you to view files beginning with `.` (i.e. dotfiles).

### cd

Using `cd` changes the current directory to the one specified. You can use relative (i.e. `cd directoryA`) or absolute (i.e. `cd /home/username/directoryA`) paths.

### pwd

The `pwd` command displays the name of the present working directory: on a Raspberry Pi, entering `pwd` will output something like `/home/username`.

### mkdir

You can use `mkdir` to create a new directory, e.g. `mkdir newDir` would create the directory `newDir` in the present working directory.

### rmdir

To remove empty directories, use `rmdir`. So, for example, `rmdir oldDir` will remove the directory `oldDir` only if it is empty.

### rm

The command `rm`removes the specified file (or recursively from a directory when used with `-r`). Be careful with this command: files deleted in this way are mostly gone for good!

### cp

Using `cp` makes a copy of a file and places it at the specified location (this is similar to copying and pasting). For example, `cp ~/fileA /home/otherUser/` would copy the file `fileA` from your home directory to that of the user `otherUser` (assuming you have permission to copy it there). This command can either take `FILE FILE` (`cp fileA fileB`), `FILE DIR` (`cp fileA /directoryB/`) or `-r DIR DIR` (which recursively copies the contents of directories) as arguments.

### mv

The `mv` command moves a file and places it at the specified location (so where `cp` performs a 'copy-paste', `mv` performs a 'cut-paste'). The usage is similar to `cp`. So `mv ~/fileA /home/otherUser/` would move the file `fileA` from your home directory to that of the user otherUser. This command can either take `FILE FILE` (`mv fileA fileB`), `FILE DIR` (`mv fileA /directoryB/`) or `DIR DIR` (`mv /directoryB /directoryC`) as arguments. This command is also useful as a method to rename files and directories after they've been created.

### touch

The command `touch` sets the last modified time-stamp of the specified file(s) or creates it if it does not already exist.

### cat

You can use `cat` to list the contents of file(s), e.g. `cat thisFile` will display the contents of `thisFile`. Can be used to list the contents of multiple files, i.e. `cat *.txt` will list the contents of all `.txt` files in the current directory.

### head

The `head` command displays the beginning of a file. Can be used with `-n` to specify the number of lines to show (by default ten), or with `-c` to specify the number of bytes.

### tail

The opposite of `head`, `tail` displays the end of a file. The starting point in the file can be specified either through `-b` for 512 byte blocks, `-c` for bytes, or `-n` for number of lines.

### chmod

You would normally use `chmod` to change the permissions for a file. The `chmod` command can use symbols `u` (user that owns the file), `g` (the files group) ,  and `o` (other users) and the permissions `r` (read), `w` (write), and `x` (execute). Using `chmod u+x *filename*` will add execute permission for the owner of the file.

### chown

The `chown` command changes the user and/or group that owns a file. It normally needs to be run as root using sudo e.g. `sudo chown username:root *filename*` will change the owner to username and the group to root.

### ssh

`ssh` denotes the secure shell. Connect to another computer using an encrypted network connection.
For more details see [SSH (secure shell)](../../remote-access/ssh/)

### scp

The `scp` command copies a file from one computer to another using `ssh`.
For more details see [SCP (secure copy)](../../remote-access/ssh/scp.md)

### sudo

The `sudo` command enables you to run a command as a superuser, or another user. Use `sudo -s` for a superuser shell.
For more details see [Root user / sudo](root.md)

### dd

The `dd` command copies a file converting the file as specified. It is often used to copy an entire disk to a single file or back again. So, for example, `dd if=/dev/sdd of=backup.img` will create a backup image from an SD card or USB disk drive at /dev/sdd. Make sure to use the correct drive when copying an image to the SD card as it can overwrite the entire disk.

### df

Use `df` to display the disk space available and used on the mounted filesystems. Use `df -h` to see the output in a human-readable format using M for MBs rather than showing number of bytes.

### unzip

The `unzip` command extracts the files from a compressed zip file.

### tar

Use `tar` to store or extract files from a tape archive file. It can also reduce the space required by compressing the file similar to a zip file.

To create a compressed file, use `tar -cvzf *filename.tar.gz* *directory/*`
To extract the contents of a file, use `tar -xvzf *filename.tar.gz*`

### pipes

A pipe allows the output from one command to be used as the input for another command. The pipe symbol is a vertical line `|`. For example, to only show the first ten entries of the `ls` command it can be piped through the head command `ls | head`

### tree

Use the `tree` command to show a directory and all subdirectories and files indented as a tree structure.

### &

Run a command in the background with `&`, freeing up the shell for future commands.

### wget

Download a file from the web directly to the computer with `wget`. So `wget https://www.raspberrypi.org/documentation/linux/usage/commands.md` will download this file to your computer as `commands.md`

### curl

Use `curl` to download or upload a file to/from a server. By default, it will output the file contents of the file to the screen.

### man

Show the manual page for a file with `man`. To find out more, run `man man` to view the manual page of the man command.

### grep

Use `grep` to search inside files for certain search patterns. For example, `grep "search" *.txt` will look in all the files in the current directory ending with .txt for the string search.

The `grep` command supports regular expressions which allows special letter combinations to be included in the search.

### awk

`awk` is a programming language useful for searching and manipulating text files.

### find

The `find` command searches a directory and subdirectories for files matching certain patterns.

### whereis

Use `whereis` to find the location of a command. It looks through standard program locations until it finds the requested command.

### ping

The `ping` utility is usually used to check if communication can be made with another host. It can be used with default settings by just specifying a hostname (e.g. `ping raspberrypi.org`) or an IP address (e.g. `ping 8.8.8.8`). It can specify the number of packets to send with the `-c` flag.

### nmap

`nmap` is a network exploration and scanning tool. It can return port and OS information about a host or a range of hosts. Running just `nmap` will display the options available as well as example usage.

### hostname

The `hostname` command displays the current hostname of the system. A privileged (super) user can set the hostname to a new one by supplying it as an argument (e.g. `hostname new-host`).

### ifconfig

Use `ifconfig` to display the network configuration details for the interfaces on the current system when run without any arguments (i.e. `ifconfig`). By supplying the command with the name of an interface (e.g. `eth0` or `lo`) you can then alter the configuration: check the manual page for more details.
### Finding out about a command

To find out more information about a particular command then you can run the `man` followed by the command you want to know more about (e.g. `man ls`). The man-page (or manual page) for that command will be displayed, including information about the flags for that program and what effect they have. Some man-pages will give example usage.

### The terminal in other Operating Systems

This course focuses mainly on a Linux environment, which can be utilised in Windows through the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10). If you are using alternative terminals or operating systems, you can check out the guides below:

- [Mac OS](https://blog.teamtreehouse.com/introduction-to-the-mac-os-x-command-line)
- [Windows Powershell](https://programminghistorian.org/en/lessons/intro-to-powershell)

## Python virtual environments

## Version control with git

Hello
