# Intro    
  
Hello there, thanks for dropping by! These are my linux dotfiles. Feel free to read through my configurations or use for your own setup. Enjoy!  
  
# Programs I use  
  
| Tool                  | Program                               |  
|-----------------------|---------------------------------------|  
| Window manager        | awesomewm*                            |  
| Application launcher  | rofi*                                 |  
| Compositor            | picom jonaburg fork*                  |  
| Terminal              | alacritty*                            |  
| Brightness tool       | brillo (I like its options/arguments) |  
| Browser               | firefox                               |  
| File manager          | ranger/thunar                         |  
| Music player          | spotify                               |  
| Editor                | vscode                                |  
*configs included in dotfiles  
  
# Setup  
  
1. Install the packages  
  
On arch:  
`yay -S acpi alacritty alsa-utils awesome cmatrix code firefox pavucontrol pulseaudio picom-jonaburg-git python python-pillow python-pip rofi ranger rofi-calc spotify thunar`  
  
2. Install my files  
  
First, clone the repo (I recommend doing it from home directory):  
`git clone https://github.com/mirasl/dots`  
`cd dots`  
  
Now is your chance to back stuff up! (If you don't have config files for these programs already, you should be fine.)  
Backup your awesome configs: `mv ~/.config/awesome ~/.config/awesome_backup`  
Backup your picom config: `mv ~/.config/picom ~/.config/picom_backup`  
Backup your rofi config: `mv ~/.config/rofi ~/.config/rofi_backup`  
Backup your alacritty config: `mv ~/.config/alacritty ~/.config/alacritty_backup`  
  
Next, move the files you want into your actual config file.   
Move awesome: `cp -r .config/awesome ~/.config/awesome`  
Move picom: `cp -r .config/picom ~/.config/picom`  
Move alacritty: `cp -r .config/alacritty ~/.config/alacritty`  
Move rofi: `cp -r .config/rofi ~/.config/rofi`  
  
Important note! My setup includes automated theme switching via the desktop menu. This relies on having picom, alacritty, and rofi setup in the way I configured them and otherwise could mess things up. See the Automated Theme Switching section below for more info.  
  
3. Add ~/bin to $PATH  
  
Source ~/bin to $PATH environment variable:  
`echo "export PATH='\$HOME/bin:\$PATH'" >> ~/.xinitrc`  
(side note, many of the bash scripts are just meant to be used by the awesomewm config files in the interest of refactored code, you don't need to worry about using them yourself all that much.)  
  
4. Install the fonts  
  
Here are the fonts I used:  
CHICKEN Pie  
Best Valentina  
Blacksword  
Ubuntu-Light  
simplifica  
*adobe source code pro  
*cantarell  
storybook ending  
pretty girls script  
  
These fonts are included in the fonts folder of this repository. To install the fonts:  
`sudo cp -r fonts /usr/share/fonts`  
Then refresh system fonts:  
`fc-cache -v`  
  
# Automated theme switching:  
Thanks to some light bash scripting, awesomewm config, and janky tkinter animations, you can switch the general theme of your computer via the main menu, available by right-clicking on the desktop. This changes the colors, fonts, and layout of the taskbar and sidebar, as well as the default look of alacritty.
  
# My hotkeys:  
  
These are my default hotkeys. You can change these in rc.lua, under the BINDINGS section. My "super" key is the windows key, but you can also change this in rc.lua.  
  
| Hotkey                | Function                              |
|-----------------------|---------------------------------------|
| super ;               | toggle sidebar                        |  
| super shift ;         | toggle taskbar                        |  
| super ctrl ;          | enter logout screen                   |  
| super up_arrow        | raise opacity of current window       |  
| super down_arrow      | lower opacity of current window       |  
| super shift up_arrow  | set opacity of current window to 100  |  
