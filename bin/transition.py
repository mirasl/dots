#!/usr/bin/env python3    
# TRAAAAAANSITION!!
# This is a simple python script to draw a black square which moves across
# the screen like a bad powerpoint transition. In the middle, while the screen
# is black, awesomewm restarts and changes theme.

from cmath import pi
from tkinter import *
from math import sin, cos
import time
import os
import sys

SCREEN_WIDTH : int = 1920
SCREEN_HEIGHT : int = 1080
theme = sys.argv[1] # first shell argument
theme_colors = [ # each element: [0] background [1] foreground
    ['purple', 'hotpink'], # grape
    ['white', 'gray'], # fantasy
    ['lightgray', 'gray15'], # pico
    ['lightblue', '#db6975'], # whisper
    ['black', 'pink'], # pink
    ['#1E1E2E', '#89B4FA'] # catppuccin (fg is blue)
]

bg_color = ''
fg_color = ''
if int(theme) - 1 < len(theme_colors):
    bg_color = theme_colors[int(theme) - 1][0]
    fg_color = theme_colors[int(theme) - 1][1]
else:
    bg_color = 'black'
    fg_color = 'white'

root = Tk()

root.geometry(str(SCREEN_WIDTH + 20) + "x" + str(SCREEN_HEIGHT + 20) + "+-" + str(SCREEN_WIDTH + 20) + "+0")
root.config(bg=bg_color)
root.overrideredirect(True)
root.attributes('-topmost',True) 

loading_label = Label(root, text="   ", font=("courier", 200), bg=bg_color, fg=fg_color)
loading_label.place(x=int(SCREEN_WIDTH/2) - int(loading_label.winfo_reqwidth()/2), y=int(SCREEN_HEIGHT/3))

def transition(out = False, frames = SCREEN_WIDTH + 40):
    offset = 0
    if out:
        offset = frames # cancels out frames
    for i in range(0, frames, 10):
        root.geometry("+" + str(-1 * (frames - i - offset)) + "+0")
        root.update()
        time.sleep(0.002 - (i/frames)*0.002)
    return True

transition(out=False)



os.system("theme.sh " + str(theme))
progress = ""
for i in range(0, 3):
    progress += "."
    loading_label.config(text=progress)
    root.update()
    for i in range(1, 20):
        root.lift() # must be constantly lifting to stay above awesomewm
        time.sleep(0.01)

transition(out=True)

root.destroy()

#mainloop()
