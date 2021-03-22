#SingleInstance, Force

;2560x1440
xMana = 207
yMana = 1369
manaColor = 0x665751
xPotion = 300
yPotion = 1380
potionColor = 0xB672F7

xHome = 2196
yHome = 1335
homeColor = 0xC0C0C0
xSetMark = 2260
ySetMark = 1340
xTpMark = 2308
yTpMark = 1300
xSpellbook = 2461
ySpellbook = 1250
spellbookColor = 0xAC4452

;Desktop 1280x720
; xMana = 106
; yMana = 711
; manaColor = 0x655147
; xPotion = 150
; yPotion = 714
; potionColor = 0xF4CAFF

; xCommons = 1073
; yCommons = 674
; xHome = 1096
; yHome = 690
; homeColor = 0xA7A7A7
; xSetMark = 1127
; ySetMark = 690
; xTpMark = 1156
; yTpMark = 674
; xSpellbook = 1234
; ySpellbook = 650
; spellbookColor = 0xA84150

;18000000
F9::
SetTimer, StopAFK, -18000000
MouseGetPos x, y, windId, controlId,
Loop {
    potsEmpty = 0
    PixelGetColor, foundManaColor, %xMana%, %yMana%, Alt RGB
    if (foundManaColor = manaColor) { ;if mana is empty
        loop {
            MouseMove %xSpellbook%, %ySpellbook%
            sleep 100
            PixelGetColor, foundSpellbookColor, %xSpellbook%, %ySpellbook%, Alt RGB
            sleep 100
            if (foundSpellbookColor = spellbookColor) {
                Break
            }
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
        ; MsgBox, ,,"potion available", 3
            potsEmpty = 0
            ;Use potion
            MouseMove %xPotion%, %yPotion%
            send {Click %xPotion%, %yPotion%}
            sleep 500
        } else {
            ; MsgBox "potions empty"
            potsEmpty = 1
        }
    }
    if (potsEmpty = 1) { 
        ; MsgBox, ,,"running minigames", 3
        sleep 100
        loop { ;click 'Go Home' until it works
            Send {Click %xHome%, %yHome%}
            PixelGetColor, homeButton, %xHome%, %yHome%, Alt RGB
            sleep 100
            if (homeButton = homeColor) {
                Break
            }
        } ;go home, run minigame, back to mark, set new mark
        Sleep 10000
        RunWait C:\Users\ajeho\Desktop\Minigame.ahk
        sleep 1000
        Send {Click %xTpMark%, %yTpMark%}
        sleep 10000
        Send {Click %xSetMark%, %ySetMark%}
        sleep 100
        Send {w Down} 
        sleep 1200
        Send {w Up} 
        sleep 500
    }
    ;auto-clicker for spells
    MouseMove %x%, %y%,
    sleep 50
    send {Click %x% %y%}
    sleep 100
    ;auto-move to end invincibility
    send {w down}    
    sleep 1
    send {w up}

    sleep 1000
}

StopAFK:
    WinClose, Wizard101,, 2000
    exitapp
F10::Reload
+Esc::
    exitapp
return
