from tkinter import *
import time

SCREEN_WIDTH = 1920
SCREEN_HEIGHT = 1080
BG_COLOR = "black"
FG_COLOR = "green"

root = Tk()
root.configure(bg=BG_COLOR)
root.overrideredirect(True)
root.attributes('-alpha', 0.4)

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

def shrink(current_width : int, current_height : int, speed=1):
    midx = int(SCREEN_WIDTH/2)
    midy = int(SCREEN_HEIGHT/2)

    root.geometry(str(current_width) + "x" + str(current_height) + "+" + str(int(midx - current_width/2)) + "+" + str(int(midy - current_height/2)))

    for i in range(int(current_width), 10, -speed):
        root.geometry(str(i) + "x" + str(current_height) + "+" + str(int(midx - i/2)) + "+" + str(int(midy - current_height/2)))
        root.update()
        time.sleep(0.0002)
    
    for i in range(int(current_height), 10, -speed):
        root.geometry("10x" + str(i) + "+" + str(midx - 5) + "+" + str(int(midy - i/2)))
        root.update()
        time.sleep(0.0002)
    
    return True

def write(label, text : str, waittime=0.03):
    for i in range(0, len(text)):
        label.config(text=text[0:i+1])
        root.update()
        time.sleep(waittime)
    return True


done = expand(width=1200, height=700, speed=1.2)

top_label = Label(root, text="", justify="left", wraplength=1500, 
        fg=FG_COLOR, bg=BG_COLOR, font=("Courier", 15))
top_label.grid(row=0, column=0, padx=180, pady=20)

ascii_text = """ __          __  _                              __  __ _             
 \ \        / / | |                            |  \/  (_)            
  \ \  /\  / /__| | ___ ___  _ __ ___   ___    | \  / |_ _ __ __ _   
   \ \/  \/ / _ \ |/ __/ _ \| '_ ` _ \ / _ \   | |\/| | | '__/ _` |  
    \  /\  /  __/ | (_| (_) | | | | | |  __/_  | |  | | | | | (_| |_ 
     \/  \/ \___|_|\___\___/|_| |_| |_|\___( ) |_|  |_|_|_|  \__,_(_)
                                           |/                        """

done = write(label=top_label, text=ascii_text, waittime=0.003)

bottom_label = Label(root, text="", justify="left", wraplength=1500, 
        fg=FG_COLOR, bg=BG_COLOR, font=("Courier", 15))
bottom_label.grid(row=1, column=0, padx=180, pady=20)

running_text = """
Hacking into network...
[.................................]

R   T   S   A   D   A   S   -
U   E   Y   N   I   S   U   V
N   S   S   D   A       P   I
N   T   T       L       E   S
I       E       O       R   O
N       M       G       -   R
G       S       S           .
                            .
"""

done = write(label=bottom_label, text=running_text, waittime=0.003)
time.sleep(0.5)

binary_text = """
I N I T I A L I Z I N G
B I N A R Y
H E X A D E C I M A L
C O N V E R S I O N . . .
. . . . . . . . . . . . .
"""

done = write(label=top_label, text=binary_text, waittime=0.003)

matrix_text = [
"""
    0   1   1   0   1       0   1   0   1       1   1   0   1   0       1   0   
0       1   0   1   1   0   1   0   1       1   1       1   1   0   1   0   1   
0   1       0       0   0   0   1       0   1   0   0       0   0   0       1   
1   0   1       0       1   0   0   0   1   0       0   0   1       0   0   0   
    0   0   1   0   0       1   1   1           0   1       0   1   1   1       
1       1       1   1   0       1   0   1   0   1   0   1   1       1   1   0   
0   1   0   1   0   0   1   1   0   1   0       0   1   0   0   1   1   0       
0   0   0   1       0   1   0   0       0   0   0       1           0   0   1   
1       0   0   0       0       0   0   1   1   0   0       1   0       0       
0   1   1       1       0   0   1   0   0   1       1   1   1   0   0   1   0   
"""
,
"""
0   1   0   1   0   0   1   1   0   1   0   1   0   1   0   0   1       0   1   
    0       1   1   0       0   0           0   0   1       0   1   0   0   1   
1       0   0       1   0   1   0   0   1   1       0   0       0   1   0       
0   1   1   1       1       0       0   0       1       1   1   0           0   
1   0       1   0   1   0   0   1   0   1   0   1   1       1   0   0   1   0   
        1   0   1   1   0       0   1       1   1       1   1   0   1   0       
0   1   0       1   0   0   0   1   1   0       0   0   1                   1   
1       1   0   0   1       0           1   0   1       0   1   1   0   0   0   
    0   0   1   0   0   1   1   1   1   1       0   1       0   1       1       
1   0       0       1   0       1       1   0   1   0   1       0   1   1   0   
"""
,
"""
1   0       0   0   1   1   0       0   1   0   1   0   0   1   1   0   0       
1   0   0   1           1   1   1   1   1   0   0   1   0   0   1   1   1   1   
        1   0   1   1   0       1       1   0   1       1       0       1   0   
0   1   0   1           1   1   0   1   0       0       0   0   1   1   0   1   
        0   1   1   0       0   0   1   0   0   0   1   1   0   1       0   1   
1   1       0   0   1   0   1       0   1   1       0   0   1       1   0       
0   1   1   1       1           1           1   1   1   1   1   0       1   0
        1   1   0   1   0       0   1   0   1       0   1       0   1    
0   1   1   0   1   1   0   1   0   1   0   1   1           1   0   1   0    
0   1       0   1       0   0   1       0       0   0   1   0       0   1   1
"""
]

done = write(label=bottom_label, text=matrix_text[0], waittime=0.0001)
for i in range(0, 10):
    for matrix in matrix_text:
        bottom_label.config(text=matrix)
        root.update()
        time.sleep((75-7.5*i)/1000)

hexadecimal_text = """
42 65 6C 69 65 76 65 20 6D 65 20 64 61 72 6C 69 6E 67 2C 20 74 68 65 20 73 74 
61 72 73 20 77 65 72 65 20 6D 61 64 65 20 66 6F 72 20 66 61 6C 6C 69 6E 67 0A 
4C 69 6B 65 20 6D 65 6C 74 69 6E 67 20 6F 62 65 6C 69 73 6B 73 20 61 73 20 74 
61 6C 6C 20 61 73 20 61 6E 6F 74 68 65 72 20 72 65 61 6C 6D"""

done = write(label=bottom_label, text=hexadecimal_text, waittime=0.001)

done = write(label=top_label, text="[Initializations complete] welcome to the machine", waittime=0.01)

quote = """
Y  N  C  I  O  P  B  I
O  O  R  F  N  E  E  N
U  T  A     E  R  L
'     Z  E     S  I  Y
R     Y  V     O  E  O
E        E     N  V  U
         N        E  .
                  S  .
"""

done = write(label=bottom_label, text=quote, waittime=0.005)

done = write(label=top_label, text="Triangulating 3-dimensional coordinate gridlines...")

hallway_ascii = """
88888888888888888888888888888888888888888888888888888888888888888888888
88.._|      | `-.  | `.  -_-_ _-_  _-  _- -_ -  .'|   |.'|     |  _..88
88   `-.._  |    |`!  |`.  -_ -__ -_ _- _-_-  .'  |.;'   |   _.!-'|  88
88      | `-!._  |  `;!  ;. _______________ ,'| .-' |   _!.i'     |  88
88..__  |     |`-!._ | `.| |_______________||."'|  _!.;'   |     _|..88
88   |``"..__ |    |`";.| i|_|MMMMMMMMMMM|_|'| _!-|   |   _|..-|'    88
88   |      |``--..|_ | `;!|l|MMo-----oMM|1|.'j   |_..!-'|     |     88
88   |      |    |   |`-,!_|_|MM| 303 |MM|_||.!-;'  |    |     |     88
88___|______|____!.,.!,.!,!|d|MMo-----oMM|p|,!,.!.,.!..__|_____|_____88
88      |     |    |  |  | |_|MMMMbMdMMMM|_|| |   |   |    |      |  88
88      |     |    |..!-;'i|r|MPYMoMMMMoM|r| |`-..|   |    |      |  88
88      |    _!.-j'  | _!,"|_|M) (MMMoMMM|_||!._|  `i-!.._ |      |  88
88     _!.-'|    | _."|  !;|1|M) (MoMMMMM|l|`.| `-._|    |``-.._  |  88
88..-i'     |  _.''|  !-| !|_|MMMoMMMMoMM|_|.|`-. | ``._ |     |``"..88
88   |      |.|    |.|  !| |u|MoMMMMoMMMM|n||`. |`!   | `".    |     88
88   |  _.-'  |  .'  |.' |/|_|MMMMoMMMMoM|_|! |`!  `,.|    |-._|     88
88  _!"'|     !.'|  .'| .'|[@]MMMMMMMMMMM[@] \|  `. | `._  |   `-._  88
88-'    |   .'   |.|  |/| /                 \|`.  |`!    |.|      |`-88
88      |_.'|   .' | .' |/                   \  \ |  `.  | `._    |  88
88     .'   | .'   |/|  /                     \ |`!   |`.|    `.  |  88
88  _.'     !'|   .' | /                       \|  `  |  `.    |`.|  88
88 vanishing point 888888888888888888888888888888888888888888888 fL 888
"""

done = write(label=bottom_label, text=hallway_ascii, waittime=0.0001)

done = write(label=top_label, text="PREPARATIONS COMPLETE", waittime=0.05)
time.sleep(0.2)

top_label.config(text="")
bottom_label.config(text="")

done = shrink(current_width=1200, current_height=700, speed=2)

root.destroy()