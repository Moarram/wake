# wake
Macbooks sleep when the lid is closed (unless plugged in to an external monitor). To keep the Macbook awake we can use `pmset disablesleep`. I made a convenience script `wake.sh` that disables sleep and automatically re-enables it when quit.



## `pmset disablesleep`
I stumbled across this command on a forum somewhere. The `pmset` man pages have no mention of `disablesleep` but it does in fact disable sleep, even with a closed lid.

**WARNING:** The Macbook has reduced cooling capability while the lid is closed and could overheat in a confined space (such as a backpack).

Disable sleep
```bash
sudo pmset disablesleep 1
```

Re-enable sleep
```bash
sudo pmset disablesleep 0
```



## `wake.sh`

The script simply wraps the above commands. It will disable sleep while running and re-enable when it quits.

### Give executable permissions

In order to run the script, give the script [executable permission](https://support.apple.com/guide/terminal/make-a-file-executable-apdd100908f-06b3-4e63-8a87-32e71241bab4/2.10/mac/10.15) with `chmod +x wake.sh`.

It can now be run in the same directory (or with full path)
```bash
sudo ./wake.sh
```

### *Make script global (optional)*

If you want to run the script from anywhere add it to `/usr/local/bin`. To do this make a link with `sudo ln -s /your/absolute/path/to/wake.sh /usr/local/bin/wake`.

It can now be run anywhere
```bash
sudo wake
```

### *Remove pmset password requirement (optional)*

The power management command `pmset` requires sudo to run. If you don't want to enter your password each time you can set it to not require password for your user.

**WARNING:** Do this at your own risk... removing the password requirement obviously reduces security.

1. Open the sudo configuration editor in your terminal with `sudo visudo`.
1. Add to the end of the file `<user> ALL=(ALL) NOPASSWD: /usr/bin/pmset` where `<user>` is your username.
1. Save changes with `:wq`.

It can now be run without password
```bash
wake
```
