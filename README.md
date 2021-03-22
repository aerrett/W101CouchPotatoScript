# W101CouchPotatoScript
This script will allow you to automatically farm for Couch Potatoes as well as check for empty mana, then refill it with a potion. If there are no potions left, it will take you to the minigame sigil and play through Potion Motion to refill them, then go back to farming using a mark. 

**You must install AutoHotKey to use this script**
 Go to https://www.autohotkey.com/ and download the current version.

**HOTKEYS** _Note_: You may need to press the Stop or Close hotkey multiple times. Not sure why, just do it to be safe.
1. _F9_ = **Start**: Once the script is opened, this will start it running.
2. _F10_ = **Stop**: This is the Stop key once it is running. This will cause the script to stop making actions, but stay open so you can easily start it again. Use for pauses in farming, like to sell gear or empty inventory.
3. _Shift+Esc_ = **Close/Panic**: This will close the running or stopped script completely. Use this when you are done farming, or as a panic button.

**WARNINGS**
1. **THIS SCRIPT LOCKS YOUR MOUSE DURING USE, IT IS MEANT FOR TRUE AFK NOT BACKGROUND FARMING**
2. **PRESS _F10_ or _SHIFT+ESC_ BEFORE DOING ANYTHING ELSE ON YOUR COMPUTER**
3. **DO NOT CHANGE WINDOWS WHILE SCRIPT IS RUNNING, IT WILL CONTINUE CLICKING BUT WILL SWITCH TO THE NEW WINDOW**

**How it Works**
1. Auto-clicker for casting spells in battle.
2. Auto-mover to shorten the time spent invincible after a battle.
3. When you run out of mana (a little less than 10% remaining), it will detect it and start looping to use a potion to refill it.
4. If a potion is available, it will use it and contine with main battle loop.
5. If there is no potion available, it will wait until you are out of the current battle (detected by seeing the spellbook on the bottom right), and teleport you to your house.
6. Now it calls the Minigame.ahk script to automatically move you from your house, to the Spiral Door, to Wizard City, then to the Minigame Sigil.
7. Once at the Minigame sigil, it starts Potion Motion and plays 4 times up to _about_* 2000 points, which will refill a potion. *(There is a chance it won't fill all of them but since it loops it isn't a huge problem)
8. After refilling your potions it goes back to your original mark in Savarstaad pass, sets a new mark, and walks forward into range of the enemies.
9. Repeat this entire process until either _F10_ is pressed to end it, or 5 hours pass. If 5 hours have passed, it will close Wizard101 and end the script. (Timer can be changed)

**Before you Start**
1. You must have a 40% speed mount equipped for this to work, otherwise timings will be off.
2. Make sure you have a deck that is only AOE spells that can one shot these enemies (310 health). Ice and Fire may be slower due to resists and shields.
3. You will also need to have a house that is not the dorm (It must have a Spiral Door behind you when you teleport there).
4. I highly recommend emptying your inventory of everything that is not equipped. This will help to prevent your inventory overflowing with drops, and also makes it easier to sell everything after.


**How to Use It**
1. Download both scripts to the same directory path.
2. Run Wizard101 in 1280x720 resolution with Fullscreen turned off.
3. Open the Script by running it in Windows
4. Go to Savarstaad Pass in Grizzleheim and find the Troubled Warriors in the clearing just above the teleporter hub.
5. On the side closest the teleporter hub, there is a strip of grass you can stand in.
6. There are two rocks on this strip of grass, stand just to the right of the rightmost rock, facing the large runic rock in the center and place your marker.
7. Now walk forward until you are in the path of the enemies.
8. Place your cursor over the middle spell in your deck.
9. Press _F9_ to start the script.
10. If you need to pause, press _F10_.
11. When you are done, or otherwise need to end the script, press _Shift+Esc_.


**Notes**
 This script has worked mostly fine for overnight farming on my own PC, the only issue being that the game crashes at some point during the night. I added the 5 hour timer to try to avoid the game sitting frozen.
 I have the Avalon Castle Plot, so there is a chance that the Potion Refilling might get stuck when it tries to back into the Spiral Door. I recommend testing this by emptying your mana and potions, then running the script from somewhere other than your house to see if you make it to Bartelby. If you do, then it works fine. If not, adjust the 'toSpiralDoor' variable in Minigame.ahk. Larger if you are not going far enough, smaller if you go to far.
