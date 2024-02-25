# Deskterm - but improved!
Deskterm - because who doesn't want a desktop that looks like this?  
![Screenshot](https://raw.githubusercontent.com/ranchordo/deskterm-improved/other/screenshot.png)
  
Deskterm improved is made mostly for Ubuntu, and should work on other Debian-based systems running with GNOME (on X11!) (eg. Pop!, Elementary, etc). Running on other systems should be doable, but it may require some modification.  
## Installation
Installation is as easy as:
```
git clone https://github.com/ranchordo/deskterm-improved
cd deskterm-improved
chmod +x installDeskterm.sh
./installDeskterm.sh
```
However, deskterm-improved requires the GNOME Extention [Pixel Saver](https://github.com/pixel-saver/pixel-saver) to hide the large menu bar.  
<br><br>
If you want to run your own scripts or change the terminal's functionality, most functionality is specified in `~/.deskterm/startup.sh`.
  
## Uninstalling
Uninstalling is also easy:
```
~/.deskterm/uninstall.sh
```
