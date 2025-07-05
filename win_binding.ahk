#Requires AutoHotkey v1.1+
#SingleInstance Force

; ######################
; Platform / Os Modifiers 
; CMD.1 & ALT.1
; ######################

; CMD.1 App Finder Search
LWin::return
~<#Space::Send, {RWin}
; CMD.2 App-switching (interactive menu)
<#Tab::
    Send, {LAlt down}{Tab}
    KeyWait, LWin 
    Send, {LAlt up}
return
; CMD.3 Kill Application
<#q::Send, >!{F4}

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
<#c::Send, ^c
<#x::Send, ^x
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
<#f::Send, ^f
~<#l::Send, ^l
; CMD.3 Delete word to left
<#Backspace::Send, ^{Backspace}
<#Delete::Send, ^{Delete}

; ############
; VScode
; CMD.3 & ALT.3
; ############

; CMD.1 Move 4 lines
<#Up::Send, !{Up} ; Ctrl + Up
<#Down::Send, !{Down} ; Ctrl + Down
<#+Up::Send, !+{Up}
<#+Down::Send, !+{Down}
; CMD.2 New line below
<#Enter::Send, ^{Enter}
; CMD.4 Panel Interactions
<#/::Send, ^/
<#b::Send, ^b
<#i::Send, ^i
<#+x::Send, ^+x
<#+e::Send, ^+e
<#+p::Send, ^+p
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