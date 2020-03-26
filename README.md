# wake

Macbooks always go to sleep when the lid is closed, unless they are plugged in to an external monitor. There exists a hidden command `pmset disablesleep` which disables the sleep feature. 

My `wake.sh` script calls this command to prevent the Macbook from going to sleep and reverts it when the script exits.

## `pmset disablesleep`

If you want to permanently disable sleep, or just test out the command yourself:

Disable sleep: `sudo pmset disablesleep 1`

Enable sleep: `sudo pmset disablesleep 0`

One side effect, at least on my machine, is that the keyboard backlight doesn't turn back on after closing and re-opening the lid when sleep is disabled. Adjusting the keyboard brightness turns it back on though.

## `wake.sh`

The script is a simple wrapper for the above commands. It's intended for temporarily disabling sleep, so it turns sleep back on when the script exits. 

## Setup

### 1. Give executable permissions

In order to run the script, give the script [executable permission](https://support.apple.com/guide/terminal/make-a-file-executable-apdd100908f-06b3-4e63-8a87-32e71241bab4/2.10/mac/10.15) with `chmod +x wake.sh`. 

It can now be run from Terminal in the same directory with `sudo ./wake.sh`.

### 2. Make script global (optional)

If you want to run the script from anywhere add it to `/usr/local/bin`. Or, save it wherever you want and make a link to it with `ln -s /path/to/wake.sh /usr/local/bin/wake`.

It can now be run from Terminal with `sudo wake`.

### 3. Remove pmset password requirement (optional)

The power management command `pmset` requires sudo to run. If you don't want to enter your password each time you can set it to not require password for your user.

1. Open Terminal
2. Open the sudo configuration editor with `sudo visudo`.
3. Add to the end of the file `<user> ALL=(ALL) NOPASSWD: /usr/bin/pmset` where `<user>` is your username.
4. Save changes with `:wq`.

It can now be run from Terminal with `wake`, or by clicking on the script in Finder.
