;Alex Errett
;3/22/2021

;Script to automatically farm Couch Potatoes by casting spells, then refill mana when it is empty, and call Minigame to refill potions when they are empty

#SingleInstance, Force

;Desktop 1280x720       ;Must use 720p resolution
xMana = 106
yMana = 711
manaColor = 0x655147
xPotion = 150
yPotion = 714
potionColor = 0xF4CAFF

xCommons = 1073
yCommons = 674
xHome = 1096
yHome = 690
homeColor = 0xA7A7A7
xSetMark = 1127
ySetMark = 690
xTpMark = 1156
yTpMark = 674
xSpellbook = 1234
ySpellbook = 650
spellbookColor = 0xA84150

; ;2560x1440        ;Uncomment this block and comment 720p block to use 1440p resolution
; xMana = 207
; yMana = 1369
; manaColor = 0x665751
; xPotion = 300
; yPotion = 1380
; potionColor = 0xB672F7

; xHome = 2196
; yHome = 1335
; homeColor = 0xC0C0C0
; xSetMark = 2260
; ySetMark = 1340
; xTpMark = 2308
; yTpMark = 1300
; xSpellbook = 2461
; ySpellbook = 1250
; spellbookColor = 0xAC4452


;Press F9 to start, make sure you have set a marker just outside of range of the mobs, facing them, before starting
F9::

;Script will timeout after 5 hours, closing Wizard101 and exiting the script
;Comment out line below to remove timeout, or change length (in milliseconds)
SetTimer, StopAFK, -18000000

;Hover mouse over card in battle before starting, it will save this position
MouseGetPos x, y, windId, controlId,
Loop {
    potsEmpty = 0 ;Bool for empty potions
    PixelGetColor, foundManaColor, %xMana%, %yMana%, Alt RGB ;Checks for empty mana
    if (foundManaColor = manaColor) { ;if mana is empty
        loop {
            MouseMove %xSpellbook%, %ySpellbook% ;Use spellbook to determine when out of battle
            sleep 100
            PixelGetColor, foundSpellbookColor, %xSpellbook%, %ySpellbook%, Alt RGB
            sleep 100
            if (foundSpellbookColor = spellbookColor) { ;If spellbook is found, move onto potions
                Break
            } ;If not, continue clicking cards until battle is over, this was added to avoid getting stuck in a battle
              ;when the script saw no mana and would start trying to click a potion
            sleep 100 
            Send {Click %x%, %y%} 
            sleep 100
        }
        sleep 1000
        ;Check for available potion
        MouseMove %xPotion%, %yPotion%
        sleep 100
        PixelGetColor, foundPotionColor, %xPotion%, %yPotion%, Alt RGB
        sleep 100
        if (foundPotionColor = potionColor) { ;if potion available
            potsEmpty = 0 ;still have potions
            ;Use potion
            MouseMove %xPotion%, %yPotion%
            send {Click %xPotion%, %yPotion%}
            sleep 500
        } else { ;potions empty = true
            potsEmpty = 1
        }
    }
    if (potsEmpty = 1) { ;if portions are empty, start refill script
        sleep 100
        loop { ;click 'Go Home' until it works
            Send {Click %xHome%, %yHome%}
            PixelGetColor, homeButton, %xHome%, %yHome%, Alt RGB
            sleep 100
            if (homeButton = homeColor) {
                Break
            }
        } 
        ;go home, run minigame, back to mark, set new mark, move forward back into range of mobs
        Sleep 10000
        RunWait %A_ScriptDir%\Minigame.ahk  
        sleep 1000
        Send {Click %xTpMark%, %yTpMark%}
        sleep 10000
        Send {Click %xSetMark%, %ySetMark%}
        sleep 100
        Send {w Down} 
        sleep 1200
        Send {w Up} 
        sleep 500
    } ;end of empty mana loop, continue normal battling

    ;auto-clicker for spells
    MouseMove %x%, %y%,
    sleep 50
    send {Click %x% %y%}
    sleep 100
    ;auto-move to end invincibility
    send {w down}    
    sleep 10
    send {w up}
    send {s down} 
    sleep 1
    send {s up} 

    sleep 1000
}

StopAFK: ;when timer runs out, exit Wizard101 and end script
    WinClose, Wizard101,, 2000
    exitapp
F10::Reload ;F10 to stop script without exiting
+Esc:: ;Shift+Esc to fully exit script, do it slowly, might need multiple presses
    exitapp
return
