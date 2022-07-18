# Intro

Hello there, thanks for dropping by! These are my linux dotfiles. Feel free to use as your own setup, or to simply read through the config files.

Thanks to some light bash scripting, awesomewm config, and janky tkinter animations, you can switch general theme of your computer via the main menu, available by right-clicking on the desktop. HOWEVER, this only changes a few things! It affects the placement and theming of the taskbar (with the tags and overall system info) and the sidebar (available with mod+;), as well as the wallpaper. Other configurations, such as the terminal colors or rofi theme, are up to you to configure (I get the feeling that trying to automate all of them would end up with a huge tangled mess of a computer, although I invite you to try if you are so inclined!). I currently have all other apps/programs set to the catppuccin theme, because that's the theme I use most often and it tends to go alright with the other themes.

# Programs I use

Window manager: awesomewm
Application launcher: rofi
Brightness tool: brillo (I like its options/arguments)
Browser: firefox
File manager: thunar
Music player: spotify
Terminal: alacritty

# Setup

1. Install the packages

On arch:
sudo pacman -S (will finish later ###)

2. Clone the repo

(will finish later ###)

3. Move contents of ~/bin to /usr/local/bin




    You will need to move the scripts in the bin directory to a predefined path in your $PATH environment variable, such as /usr/local/bin/. Features that require a script in the bin directory of this repo, such as the theme-switching via menu or the hacker mode startup, will not work unless you have done this. You could also add ~/bin to your $PATH, but you must source it (simply adding it to .bashrc will not work with awesomewm's awful.spawn.with_shell).

    You will need to install these fonts:

