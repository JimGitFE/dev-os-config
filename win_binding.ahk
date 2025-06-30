#Requires AutoHotkey v1.1+
#SingleInstance Force

; ######################
; Platform / Os Modifiers
; ######################

; CMD.1 App Finder Menu
LWin::return
~<#Space::Send, {RWin}
; CMD.2 App switcher interactive menu
<#Tab::
    Send, {LAlt down}{Tab}
    ; This is the crucial part. The script pauses here.
    KeyWait, LWin 
    Send, {LAlt up}
return
; CMD.3 Kill Application
<#q::Send, >!{F4}

; ############
; Keystrokes
; ############

; CMD.1 Word by word move
<#Left::Send, ^{Left}
<#Right::Send, ^{Right}
<#+Left::Send, ^+{Left}
<#+Right::Send, ^+{Right}
; CMD.2 Standard shortcuts
<#c::Send, ^c
<#x::Send, ^x
<#v::Send, ^v
<#d::Send, ^d
<#a::Send, ^a
<#s::Send, ^s
<#w::Send, ^w
<#r::Send, ^r
<#t::Send, ^t
<#f::Send, ^f
~<#l::Send, ^l
<#z::Send, ^z
<#+z::Send, ^+z
; CMD.3 Delete word to left
<#Backspace::Send, ^{Backspace}
<#Delete::Send, ^{Delete}


; ############
; VScode
; ############

<#b::Send, ^b
<#i::Send, ^i
<#+x::Send, ^+x
<#+e::Send, ^+e
<#+p::Send, ^+p
; vs Frame select
<#1::Send, !1
<#2::Send, !2
<#3::Send, !3
<#4::Send, !4
<#5::Send, !5
<#6::Send, !6
; vscode tab switcher interactive menu
*LAlt::LCtrl
<#/::Send, ^/
<#Enter::Send, ^{Enter}
; Allows alt => ctrl mapping (windows app switch with alt)
<#Up::Send, !{Up} ; Ctrl + Up
<#Down::Send, !{Down} ; Ctrl + Down
<#+Up::Send, !+{Up}
<#+Down::Send, !+{Down}

; ############