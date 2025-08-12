#Requires AutoHotkey v1.1+
#SingleInstance Force


; ####################################
; Platform / Os Modifiers 
; CMD.1 & ALT.1 & F#.1 & RCMD.1 & FN.1
; ####################################

; CMD.1.1 App Finder Search
LWin::return
RWin::return
~<#Space::Send, {RWin}
; CMD.1.2 App-switching (interactive menu)
<#Tab::
    Send, {LAlt down}{Tab}
    KeyWait, LWin 
    Send, {LAlt up}
return
; CMD.1.3 Kill Application
<#q::Send, >!{F4}
; F#.1.1 Media Playback
F7::Send, {Media_Prev}
F8::Send, {Media_Play_Pause}  ; Play/Pause media
F9::Send, {Media_Next}
; F#.1.2 Audio Control
F12::Send, {Volume_Up}
F11::Send, {Volume_Down}
F10::Send, {Volume_Mute}
; F#.1.3 Lock Screen
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
; FN.1.2 Forward Delete
LCtrl & Backspace::moveCursor("{Delete}", "{Delete}")
RWin & Backspace::moveCursor("{Backspace}", "{Delete}")
; RCMD.1.1 Move Cursor
RWin & k::moveCursor("{LEFT}", "{HOME}", "LAlt") ; ctrl l
RWin & `;::moveCursor("{RIGHT}", "{END}", "LAlt") ; ctrl r
RWin & o::moveCursor("{UP}", "{PgUp}") ; alt up
RWin & l::moveCursor("{DOWN}", "{PgDn}") ; alt down
moveCursor(key, onFn, asMod = "LWin") {
    shft := GetKeyState("SHIFT","P")
    ; FN.1.3 Move cursor to far end
    fn := GetKeyState("LCtrl", "P")
    ; CMD.2.1 Move cursor word by word
    cmd := GetKeyState("LWin","P")
    ; CMD.3.1 Move 4 lines
    opt := GetKeyState("LAlt", "P")
    preMod := asMod == "LAlt" or opt ? "^" : "!" ; on vscode nav tab @see Ref TODO

    wShft := shft ? "+" : ""
    wMod := cmd or opt ? preMod : ""

    if (fn and opt) {
        ; RCMD 1.2 Resize / Move Window
        SendInput, {RWin Down}%key%
    } else if (fn) {
        Send, %wMod%%wShft%%onFn%
    } else {
        Send, %wMod%%wShft%%key%
    }
}
#`;::return ; Disable emoji menu
; Disable task view (cursorMove & tab)
*Tab::
    if GetKeyState("RWin", "P")  {
        Send, {Tab} 
        return
    }
    Send, {Blind}{Tab}

; ############
; Keystrokes 
; CMD.2 & ALT.2
; ############

; CMD.2.2 Standard shortcuts
#c::Send, ^c
#x::Send, ^x
<#v::Send, ^v
<#a::Send, ^a
<#z::Send, ^z
<#+z::Send, ^+z
<#s::Send, ^s
<#r::Send, ^r
; CMD.2.2 vsc
<#j::Send, ^j
<#d::Send, ^d
<#w::Send, ^w
<#t::Send, ^t
<#+t::Send, ^+t
<#f::Send, ^f
~<#l::Send, ^l
; CMD.2.3 Delete word to left
<#Backspace::Send, ^{Backspace}
<#Delete::Send, ^{Delete}

; ############
; VScode
; CMD.3 & ALT.3
; ############

; CMD.3.2 New line below
<#Enter::Send, ^{Enter}
<#\::Send, ^{Enter}
>#\::Send, ^{Enter}
; CMD.3.4 Panel Interactions
<#/::Send, ^/
<#b::Send, ^b
<#i::Send, ^i
<#n::Send, ^n
<#+x::Send, ^+x
<#+e::Send, ^+e
<#+p::Send, ^+p
<#+n::Send, ^+n
; ALT.3.1 & ALT.3.2 Inner tab & Grab & move line 
*LAlt::LCtrl
; ALT.3.4 App frame (tab) selector
<#1::Send, !1
<#2::Send, !2
<#3::Send, !3
<#4::Send, !4
<#5::Send, !5
<#6::Send, !6

; #########################
; Layout - Magic Keyboard EU
; FN.4
; #########################

; FN.4.2 ANSI to ISO
Enter::Send, {sc056}
+Enter::+\
\::Send {Enter}
