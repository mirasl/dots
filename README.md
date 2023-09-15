# Intro    
  
Hello there, thanks for dropping by! These are my linux dotfiles. Feel free to read through my configurations or use for your own setup. Enjoy!  

# Screenshots

![2023-09-14-20:53:58](https://github.com/mirasl/dots/assets/109443521/4dec0146-1ced-4bd0-9b3d-ed5e3c941576)
![2023-09-14-20:55:06](https://github.com/mirasl/dots/assets/109443521/2a0055b7-efd7-4fa8-9882-60890de535f8)
![2023-09-14-20:57:06](https://github.com/mirasl/dots/assets/109443521/0bff9b50-2e40-4fa9-b8df-c6e41331214c)

  
# Programs I use  
  
| Tool                  | Program                               |  
|-----------------------|---------------------------------------|  
| Window manager        | awesomewm*                            |  
| Application launcher  | rofi                                 |  
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
  
On arch, using yay:  
`yay -S acpi alacritty alsa-utils awesome cmatrix pavucontrol pulseaudio picom-jonaburg-git python python-pillow python-pip rofi scrot`  
(other specifics may apply - for example, make sure you have pkg-config (`sudo pacman -S pkg-config`) before installing picom-jonagurg-git)
  
2. Install my files  
  
First, clone the repo (I recommend doing it from home directory):  
```
git clone https://github.com/mirasl/dots  
cd dots  
```
  
Now is your chance to back stuff up! (If you don't have config files for these programs already, you should be fine):  
```
mv ~/.config/awesome ~/.config/awesome_backup     # backup your awesome configs  
mv ~/.config/picom ~/.config/picom_backup         # backup your picom configs  
mv ~/.config/alacritty ~/.config/alacritty_backup # backup your alacritty configs  
```
  
Next, move the files you want into your actual config file:   
```
cd ~/dots # (if you're not there already)  
cp -r .config/awesome ~/.config/awesome  
cp -r .config/picom ~/.config/picom  
cp -r .config/alacritty ~/.config/alacritty  
```
  
Important note! My setup includes automated theme switching via the desktop menu. This relies on having alacritty setup in the way I configured it and otherwise could mess things up. See the Automated Theme Switching section below for more info.  
  
3. Modify tag colors:  
   
```
sudo cp ~/dots/other/taglist.lua /usr/share/awesome/lib/awful/widget/taglist.lua  
sudo cp ~/dots/other/tag.lua /usr/share/awesome/lib/awful/tag.lua  
```
(Moving these scripts is required, it changes awesome's tag files so that tags
can have different colors when highlighted)  
  
4. Add ~/bin to $PATH  
  
Source ~/bin to $PATH environment variable: `echo "export PATH='\$HOME/bin:\$PATH'" >> ~/.xinitrc`  
(side note, many of the bash scripts are just meant to be used by the awesomewm config files in the interest of refactored code, you don't need to worry about using them yourself all that much.)  
  
5. Install the fonts  
  
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
  
More in-depth explanation:  
The bash script `theme.sh` takes a theme number as an argument (see top of rc.lua for theme numbers - fruit is 1, fantasy is 2, etc). After verifying that
the number does indeed correlate with a theme, it runs three commands. First, it writes the current theme into the aptly named current_theme.lua file, which tells AwesomeWM what theme to load. Then it writes the theme number into the appropriate location in alacritty.yml (using search-and-replace), which sets alacritty's color scheme. Finally, it restarts awesome so that the changes take effect. That's all great, but it causes an immediate restart and doesn't look so smooth. So I also have a file named `transition.py` - this is a python file that uses tkinter to draw a window, animates in that window until it covers the screen, runs `theme.sh` while the screen is completely covered, and then after a couple of seconds animates away, revealing the changed screen. Just like magic! While the theme switch is being done, `transition.py` repeatedly lifts itself to the front every frame or so, so that it stays above anything that awesome tries to push to the front.  
  
If this all sounds contrived and messy, well, you're probably right. I was worried when doing this that it would inadvertantly link everything in my computer with duct tape and that it would all fall apart with one file rename or something. Well, I can confidently tell you that I have been using my computer for quite some time after initially creating this configuration, and have basically left things alone and encountered no problems. I mostly work in catppuccin, but every once in a while it's nice to switch over to the "pink" theme for a change of pace, or to the pico8 theme for the lols (in true Unixporn fashion, haha). It works great for me, but I can't guarentee that for you - just keep that in mind!  
  
# My hotkeys:  
  
These are my default hotkeys. You can change these in rc.lua, under the BINDINGS section. My "super" key is the windows key, but you can also change this in rc.lua.  
  
| Hotkey                | Function                              |
|-----------------------|---------------------------------------|
| super semicolon       | toggle sidebar                        |  
| super shift semicolon | toggle taskbar                        |  
| super ctrl semicolon  | enter logout screen                   |  
| super up_arrow        | raise opacity of current window       |  
| super down_arrow      | lower opacity of current window       |  
| super shift up_arrow  | set opacity of current window to 100  |  
