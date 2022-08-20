#!/usr/bin/env python3

from tkinter import *
from PIL import ImageTk, Image
import os
import time

SCREEN_WIDTH = 1920
SCREEN_HEIGHT = 1080
BG_COLOR = "darkslateblue"
STRIPE_COLOR = "#316ccc"
BUTTON_HOVER_COLOR = BG_COLOR
DIRECTORY = "/home/mira/Documents/python/logout/" # include final slash

root = Tk()
root.configure(bg=BG_COLOR)
root.overrideredirect(True)
root.wait_visibility(root)
root.wm_attributes('-alpha', 1)
#root.geometry(str(SCREEN_WIDTH + 20) + "x" + str(SCREEN_HEIGHT + 20) + "+-10+-10")

c = Canvas(root, width=SCREEN_WIDTH+20, height=SCREEN_HEIGHT+20, bg=BG_COLOR, borderwidth=0, 
        highlightthickness=0)
c.pack()

# background image:
bg_image = Image.open(DIRECTORY + "whisper.jpg")
bg_image = bg_image.resize((SCREEN_WIDTH+20, SCREEN_HEIGHT+20), Image.ANTIALIAS)
bg_image = ImageTk.PhotoImage(bg_image)
bg_image_label = Label(c, image=bg_image)
bg_image_label.place(x=-10, y=-10, width=SCREEN_WIDTH+20, height=SCREEN_HEIGHT+20)

polygon = c.create_polygon([
        SCREEN_WIDTH/10, 0, 
        2*SCREEN_WIDTH/10, 0, 
        3*SCREEN_WIDTH/10, SCREEN_HEIGHT+20, 
        2*SCREEN_WIDTH/10, SCREEN_HEIGHT+20], 
        fill=STRIPE_COLOR)



# text:
# text = Label(root, text="Goodbye Mira", font=("Blacksword", 85), bg=BG_COLOR)
# root.update()
# text.place(x=int(SCREEN_WIDTH/2) - int(text.winfo_reqwidth()/2), y=int(SCREEN_HEIGHT/4))

def exit_menu(frames=2000):
    root.destroy()

def restart():
    os.system("echo 'awesome.restart()' | awesome-client")
    root.destroy()

def shutdown():
    os.system("systemctl poweroff")
    root.destroy()

def exit_to_terminal():
    os.system("echo 'awesome.quit()' | awesome-client")
    root.destroy()

w = 80
h = 80

def get_image(path):
    global image
    image = Image.open(path)
    image = image.resize((w, h), Image.ANTIALIAS)
    image = ImageTk.PhotoImage(image)
    return image

terminal_image = get_image(DIRECTORY + "terminal.png")
restart_image = get_image(DIRECTORY + "restart.png")
shutdown_image = get_image(DIRECTORY + "shutdown.png")
home_image = get_image(DIRECTORY + "home.png")

terminal_button = Button(root, image=terminal_image, 
        command=exit_to_terminal, bg=STRIPE_COLOR, activebackground = BUTTON_HOVER_COLOR, 
        highlightthickness=0, borderwidth=0)
terminal_button.place(x=int(6*((SCREEN_WIDTH+20)/45))+20, y=int(1*SCREEN_HEIGHT/9))

restart_button = Button(root, image=restart_image, 
        command=restart, bg=STRIPE_COLOR, activebackground = BUTTON_HOVER_COLOR, 
        highlightthickness=0, borderwidth=0)
restart_button.place(x=int(7*((SCREEN_WIDTH+20)/45))+20, y=int(3*SCREEN_HEIGHT/9))

shutdown_button = Button(root, image=shutdown_image, 
        command=shutdown, bg=STRIPE_COLOR, activebackground = BUTTON_HOVER_COLOR, 
        highlightthickness=0, borderwidth=0)
shutdown_button.place(x=int(8*((SCREEN_WIDTH+20)/45))+20, y=int(5*SCREEN_HEIGHT/9))

home_button = Button(root, image=home_image, 
        command=exit_menu, bg=STRIPE_COLOR, activebackground = BUTTON_HOVER_COLOR, 
        highlightthickness=0, borderwidth=0)
home_button.place(x=int(9*((SCREEN_WIDTH+20)/45))+20, y=int(7*SCREEN_HEIGHT/9))

# animates expanding window vertically then horizontally
def expand(width : int, height : int, speed=1, startw : int = 10, starth : int = 10):
    midx = int(SCREEN_WIDTH/2)
    midy = int(SCREEN_HEIGHT/2)

    root.geometry(str(startw) + "x" + str(starth) + "+" + str(midx) + "+" + str(midy))
    
    for i in range(10, int(height/speed)):
        root.geometry(str(startw) + "x" + str(int(i*speed)) + "+" + str(midx) + "+" + 
                str(int(midy - i*speed/2)))
        root.update()
        time.sleep(0.0002)
    
    for i in range(10, int(width/speed)):
        root.geometry(str(int(i*speed)) + "x" + str(height) + "+" + 
                str(int(midx - i*speed/2)) + "+" + str(int(midy - height/2)))
        root.update()
        time.sleep(0.0002)
    
    return True

#done = expand(SCREEN_WIDTH, SCREEN_HEIGHT)
mainloop()