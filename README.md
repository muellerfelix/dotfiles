## reset

* While booting press Cmd+R
* Click on Disk Utility
* Select the startup drive(Macintosh HD)
* switch to the Erase tab and choose Mac OS Extended (Journaled) from the Format drop-down menu. 
* Select Erase
* Quit out of the Disk Utility app
* Click on Reinstall OS X

## runs the installation script
bash <(curl -fsSL https://raw.githubusercontent.com/muellerfelix/dotfiles/master/.init) 2> error.log
