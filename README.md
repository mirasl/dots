# Intro

Hello there, thanks for dropping by! These are my linux dotfiles. Feel free to read through my configurations or use for your own setup. Enjoy!

# Programs I use

|-----------------------|---------------------------------------|
| Window manager        | awesomewm*                            |
|-----------------------|---------------------------------------|
| Application launcher  | rofi*                                 |
|-----------------------|---------------------------------------|
| Compositor            | picom jonaburg fork*                  |
|-----------------------|---------------------------------------|
| Terminal              | alacritty*                            |
|-----------------------|---------------------------------------|
| Brightness tool       | brillo (I like its options/arguments) |
|-----------------------|---------------------------------------|
| Browser               | firefox                               |
|-----------------------|---------------------------------------|
| File manager          | ranger/thunar                         |
|-----------------------|---------------------------------------|
| Music player          | spotify                               |
|-----------------------|---------------------------------------|
| Editor                | vscode                                |
|-----------------------|---------------------------------------|
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
`echo "export PATH='\$HOME/bin:\$PATH'" >> .xinitrc`
(side note, many of the bash scripts are just meant to be used by the awesomewm config files in the interest of refactored code, you don't need to worry about using them yourself all that much.)

4. Install the fonts
Here are the fonts I used:
CHICKEN Pie
Best Valentina
Blacksword
Ubuntu-Light
simplifica
adobe source code pro
cantarell
storybook ending
pretty girls script

The fonts should become globally accessible by installing them, unzipping them if necessary, and moving the .ttf or .otf files to /usr/share/fonts:
`sudo mv <FONT_FILE> /usr/share/fonts`
Then do `fc-cache -v` to refresh system fonts.

# Automated theme switching:
Thanks to some light bash scripting, awesomewm config, and janky tkinter animations, you can switch the general theme of your computer via the main menu, available by right-clicking on the desktop. However, this only changes a few things! It affects the placement and theming of the taskbar (with the tags and overall system info) and the sidebar (available with mod+;), as well as the wallpaper. Other configurations, such as the terminal colors or rofi theme, are up to you to configure (I get the feeling that trying to automate all of them would end up with a huge tangled mess of a computer, although I invite you to try if you are so inclined!). I currently have all other apps/programs set to the catppuccin theme, because that's the theme I use most often and it tends to go with the other themes fine.

# My hotkeys:

These are my default hotkeys. You can change these in rc.lua, under the BINDINGS section. My "super" key is the windows key, but you can also change this in rc.lua.

| super ; | toggle sidebar |
| super shift ; | toggle taskbar |
| super ctrl ; | enter logout screen |
| super up_arrow | raise opacity of current window |
| super down_arrow | lower opacity of current window |
| super shift up_arrow | set opacity of current window to 100 |
