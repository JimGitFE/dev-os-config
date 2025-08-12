#Requires AutoHotkey v1.1+
#SingleInstance Force


; ######################
; Platform / Os Modifiers 
; CMD.1 & ALT.1 & F.1
; ######################

; CMD.1 App Finder Search
LWin::return
RWin::return
~<#Space::Send, {RWin}
; CMD.2 App-switching (interactive menu)
<#Tab::
    Send, {LAlt down}{Tab}
    KeyWait, LWin 
    Send, {LAlt up}
return
; CMD.3 Kill Application
<#q::Send, >!{F4}

F12::Send, {Volume_Up}
F11::Send, {Volume_Down}
F10::Send, {Volume_Mute}
F7::Send, {Media_Prev}
F8::Send, {Media_Play_Pause}  ; Play/Pause media
F9::Send, {Media_Next}
F6::
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
    Sleep 100
    DllCall("LockWorkStation")
    Sleep 100
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1
    Sleep 100
    SendMessage, 0x112, 0xF170, 2,, Program Manager  ; Power off monitors
    ; Hibernate
    ; DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 0)
return

; ############
; Keystrokes 
; CMD.2 & ALT.2
; ############

; CMD.1 Move cursor word by word
<#Left::Send, ^{Left}
<#Right::Send, ^{Right}
<#+Left::Send, ^+{Left}
<#+Right::Send, ^+{Right}
; CMD.2 Standard shortcuts
#c::Send, ^c
#x::Send, ^x
<#v::Send, ^v
<#a::Send, ^a
<#z::Send, ^z
<#+z::Send, ^+z
<#s::Send, ^s
<#r::Send, ^r
; CMD.2 vsc
<#j::Send, ^j
<#d::Send, ^d
<#w::Send, ^w
<#t::Send, ^t
<#+t::Send, ^+t
<#f::Send, ^f
~<#l::Send, ^l
; CMD.3 Delete word to left
<#Backspace::Send, ^{Backspace}
<#Delete::Send, ^{Delete}

cmdMap(key) {
    cmd := GetKeyState("LWin")
    if (cmd) {
        Send, ^%key%
    }

}

; ############
; VScode
; CMD.3 & ALT.3
; ############

; CMD.1 Move 4 lines
; <#Up::Send, !{Up} ; Ctrl + Up
; <#Down::Send, !{Down} ; Ctrl + Down
; <#+Up::Send, !+{Up}
; <#+Down::Send, !+{Down}
; CMD.2 New line below
<#Enter::Send, ^{Enter}
<#\::Send, ^{Enter}
>#\::Send, ^{Enter}
; CMD.4 Panel Interactions
<#/::Send, ^/
<#b::Send, ^b
<#i::Send, ^i
<#n::Send, ^n
<#+x::Send, ^+x
<#+e::Send, ^+e
<#+p::Send, ^+p
<#+n::Send, ^+n
; ALT.1 & ALT.2 Inner tab & Grab & move line 
*LAlt::LCtrl
; ALT.4 App frame (tab) selector
<#1::Send, !1
<#2::Send, !2
<#3::Send, !3
<#4::Send, !4
<#5::Send, !5
<#6::Send, !6

; ############

; Descisionsll
; win tab (def to app swap)
; alt up down (def to vscode win swap)

Enter::Send, {sc056}  ; send "\"
+Enter::+\      ; send "|"
\::Send {Enter}    ; Pressing "\" sends Enter

; Alternatively, using Alt...
RWin & k::moveCursor("{LEFT}", "{HOME}", "LAlt") ; ctrl l
RWin & `;::moveCursor("{RIGHT}", "{END}", "LAlt") ; ctrl r
RWin & o::moveCursor("{UP}", "{PgUp}") ; alt up
RWin & l::moveCursor("{DOWN}", "{PgDn}") ; alt down

; FN key 
; (macro var? = Capslock and Alt?!)
LCtrl::Return
LCtrl & Backspace::moveCursor("{Delete}", "{Delete}")
RWin & Backspace::Send, {Backspace}

; prevent tasks view
*Tab::
    if GetKeyState("RWin", "P")
    {
        ; When RWin is held and Tab pressed, send only Tab once
        Send, {Tab} 
        return
    }
    ; Otherwise, send Tab normally
    Send, {Blind}{Tab}
; return
#`;::return ; Emoji disable

; Constants
macFn := "LCtrl" ; Unused

; Navigation Combos
moveCursor(key, onFn, asMod = "LWin") {
    fn := GetKeyState("LCtrl", "P")  ; FN pressed
    cmd := GetKeyState("LWin","P") ; merge with opt as cmd
    opt := GetKeyState("LAlt", "P") ; Move line
    shft := GetKeyState("SHIFT","P")
    preMod := asMod == "LAlt" or opt ? "^" : "!" ; on vscode nav tab

    wShft := shft ? "+" : "" ; With shift
    wMod := cmd or opt ? preMod : ""

    if (fn and opt) {
        ; resize / move windows (ctrl shft)
        SendInput, {RWin Down}%key%
    } else if (fn) {
        Send, %wMod%%wShft%%onFn%
    } else {
        Send, %wMod%%wShft%%key%
    }
}
