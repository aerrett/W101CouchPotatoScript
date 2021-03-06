;Alex Errett
;3/22/2021

;Script to be called by Farming script to refill potions

#SingleInstance, Force

;1280x720 cursor positions        ;Must use 720p resolution
xWizCity = 880
yWizCity = 250
xToWorld = 860
yToWorld = 640
xPotionMotion = 700
yPotionMotion = 460
xPlayGame = 640
yPlayGame = 630
xDefault = 460
yDefault = 240
gameIncrement = 60
xCloseGame = 975
yCloseGame = 630
xContinue = 630
yContinue = 300

; ;2560x1440        ;Uncomment this block and comment 720p block to use 1440p resolution
; xWizCity = 1750
; yWizCity = 460
; xToWorld = 1700
; yToWorld = 1230
; xPotionMotion = 1400
; yPotionMotion = 880
; xPlayGame = 1270
; yPlayGame = 1200
; gameIncrement = 120
; xDefault = 920
; yDefault = 430
; xCloseGame = 1940
; yCloseGame = 1215
; xContinue = 1280
; yContinue = 560

toSpiralDoor = 600 ;Edit this number if you are not making it to Bartleby when trying to refill potions
loadTimeWait = 10000 ;Change this if you don't make it to minigame sigil. Your load times are longer than 10 seconds

; F12:: ;Don't use this it is for testing only

;Go from house to game sigil in Wizard City, yes this took took 50 lines
Send {s Down} 
sleep %toSpiralDoor%
Send {s up} 
sleep 100
Send x
sleep %loadTimeWait%
Send {Click %xWizCity%, %yWizCity%}
sleep 5
Send {Click %xToWorld%, %yToWorld%}
sleep %loadTimeWait%
Send {w Down}
sleep 4000
Send {w Up}
sleep %loadTimeWait%
Send {w Down}
sleep 6000
Send {w Up}
sleep %loadTimeWait%
Send {w Down}
sleep 1500
Send {w Up}
sleep 5
Send {d Down}
sleep 750
Send {d Up} 
sleep 5
Send {w Down} 
sleep 5000
Send {w up} 
sleep 5
Send {a Down}
sleep 640
Send {a Up} 
sleep 5
Send {w Down} 
sleep 2000
Send {w up} 
sleep 5
Send {a Down}
sleep 640
Send {a Up} 
sleep 5
Send {w Down}
sleep 1000
Send {w Up}
sleep 1000


; F8:: ;Also for testing
;Start minigame
Send x
sleep 1000
Send {Click %xPotionMotion%, %yPotionMotion%}
sleep %loadTimeWait%

;Play game to potion 4 times, NOTE: change loop number for more or less potions
loop 4 {
    Send {Click %xPlayGame%, %yPlayGame%}
    sleep 500
    loop 10 {   ;Go through each column dragging down to a random row and releasing
        xStart = 460
        yStart = 240
        
        loop 7 {
            Random yMultiply, 1, 5 
            yEnd := (gameIncrement * yMultiply) + yStart ;Get random row to drag to
            MouseMove %xStart%, %yStart%
            sleep 20
            Send {LButton Down}
            MouseMove %xStart%, %yEnd%, 3
            sleep 20
            Send {LButton Up} 
            xStart += gameIncrement ;Increment xStart to next column
        }
    }
    ;Close out of game after (hopefully) enough points, then hit continue to start again
    sleep 1000
    Send {Click %xCloseGame%, %yCloseGame%}
    sleep 500
    Send {Click %xContinue%, %yContinue%}
    sleep 4000
}
;Exit game menu
Send {Click %xCloseGame%, %yCloseGame%}
sleep %loadTimeWait%
exitapp

F10::
exitapp
+Esc:: ;Shift+Escape to exit, try not to use this one unless you aren't in the minigame
exitapp