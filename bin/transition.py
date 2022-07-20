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
theme = sys.argv[1]

root = Tk()

root.geometry(str(SCREEN_WIDTH + 20) + "x" + str(SCREEN_HEIGHT + 20) + "+-" + str(SCREEN_WIDTH + 20) + "+0")
root.config(bg='black')
root.overrideredirect(True)
root.attributes('-topmost',True)

def transition(out = False, frames = SCREEN_WIDTH + 40):
    offset = 0
    if out:
        offset = frames # cancels out frames
    for i in range(0, frames, 5):
        root.geometry("+" + str(-1 * (frames - i - offset)) + "+0")
        root.update()
        time.sleep(0.001)
    return True

transition(out=False)

os.system("theme.sh " + str(theme))
for i in range(1, 35):
    root.lift()
    time.sleep(0.01)

transition(out=True)

root.destroy()

#mainloop()
