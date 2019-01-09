# wake

Macbooks always go to sleep when the lid is closed, unless they are plugged in to an external monitor. There exists a hidden command `pmset disablesleep` which will disable this feature. My simple script uses this command to prevent a Macbook from going to sleep when the lid is closed and it ensures that sleep settings return to normal when the script closes. 

There are two versions of this script: `wake.sh` if you modify pmset to not require password and `wake2.sh` if you don't mind typing sudo and your password every time. You can rename the scripts to whatever you want.

## wake.sh

The power management command `pmset` requires sudo to run. If you don't want to enter your password each time you can set it to not require password.

1. Open Terminal
2. Open the sudo configuration editor with `sudo visudo`.
3. Add to the end of the file `[user] ALL=(ALL) NOPASSWD: /usr/bin/pmset` where `[user]` is your username.
4. Save changes with `:wq`.
5. Log out and back in again for the changes to take effect.

Give the script executable permissions with `chmod +x wake.sh`. It can now be run by `./wake.sh` in Terminal in the same directory or by clicking on `wake.sh` in Finder.

If you want to run the script from anywhere add it to `/usr/local/bin`. Or, save it somewhere more accessible and make a link to it with `ln -s /path/to/wake.sh /usr/local/bin/wake.sh`.

It can now be run from Terminal with `wake`.

## wake2.sh

This version requires sudo to run so it must be launched from Terminal. You don't need to change any of your sudo settings but you will need your password to run the script. 

Give the script executable permissions with `chmod +x wake2.sh`. It can now be run by `sudo ./wake2.sh` in Terminal in the same directory.

If you want to run the script from anywhere add it to `/usr/local/bin`. Or, save it somewhere more accessible and make a link to it with `ln -s /path/to/wake2.sh /usr/local/bin/wake2.sh`. 

It can now be run from Terminal with `sudo wake2`.

## pmset disablesleep

The main benefit the scripts provide once set up is only needing to type `wake` to run the command. Also, sleep is automatically enabled when the script is closed. If you want to permanently disable sleep, or just test out the command yourself without all the script setup hassle, here they are:

Disable sleep: `sudo pmset disablesleep 1`

Enable sleep: `sudo pmset disablesleep 0`

One side effect, at least on my machine, is that the keyboard backlight doesn't turn back on when sleep is disabled. Adjusting the brightness turns it back on though.
