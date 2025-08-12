# OpSys Standard Keyboard Map

<small> Defines a custom keyboard remapping standard for improving productivity and consistency across platforms (Windows, macOS, Linux) and applications (e.g., VSCode).</small>

## **(1) CMD**: Left Command Key

<small> **CMD / Win** Acts as a **primary platform modifier** for shortcuts (e.g., app switching, killing apps) and standard actions (e.g., copy, paste, move cursor).</small>

### (1.1) Platform - Os Modifiers

1. `Space`: **App Finder Search**
2. `Tab`: **App-Switching**
3. `Q`: **Kill application**

### (1.2) Keystrokes - Standard shortcuts

1. `Left`, `Right`: **Move cursor word by word**
2. `C`, `V`, `X`, `A`, `R`, `F`, `L`, `D`: **Standard methods**
3. `Delete`: **Delete word to left** (supr | Fn)
4. **Console** standard behaviour (ctrl)

### (1.3) Vscode - InApp:

1. `Up`, `Down`: **Move 4 lines**
2. `Enter`: **New line below**
3. `I`: **Cursor to AI Chat**
4. `B`, `X`, `E`, `P`, `N`, `J`, `/`: **Panel interactions**
5. `T`, `W`: **Tab interactions** (new | remove)

## **(2) ALT**: Left Option Key

<small> **Option / Alt** Used for **application-specific** shortcuts (e.g., brush size, selecting frames in VSCode)</small>


### (2.3) Vscode - InApp:

1. `Tab`: **Inner tab** (smooth interaction, + shift)
2. `Up`, `Down`: **Grab & move line**
2. `Shift` +  [`Up`, `Down`]: **Duplicate up or down**
5. `Numerics`: **App frame selector**

## **(3) CTRL**: Left Control Key

<small> Unused (bad touch typing) - helps remapping (extra key)</small>


## **(4) FN**: Special Key

<small> **FN** Defines **special actions** like forward delete and moving the cursor to document edges (contained within level hardware / firmware).
</small>

### (4.1) Platform - Os Modifiers

1. `Left`, `Right`, `Up`, `Down`: **Move cursor to far end**
2. `Delete`: **Forward delete**
3. `k`, `;`, `o`, `l`: **Move cursor to far end**

## **(5) F#**: Function Keys
<small>Often mapped to application-specific actions (e.g., in browsers, it may focus the address bar).</small>

### (5.1) Platform - Os Modifiers
1. `F6`: **Lock Screen** (CMD + CTRL + Q on mac)
2. `F7`, `F8`, `F9`: **Media Playback** (Previous, Pause, Next)
3. `F10`, `F11`, `F12`: **Audio Control** (Mute, Vol. Down, Vol. Up)

## **(6) RCMD** Right Command Key
<small>Inverted T arrow keys at home row</small>

### (6.1) Platform - Os Modifiers
1. `k`, `;`, `o`, `l`: **Move Cursor** (Left, Right, Up, Down)
2. `Shift` + `CapsLock` + [`k`, `;`, `o`, `l`]: **Resize / Move Window**

# Keyboard Layouts

## EU with Fn key

CapsLock => LAlt
FN => LCtrl

# Keyboard Remapping - OpSys

<small> Platform-specific remapping instructions using tools like **AutoHotkey** (Windows), **Karabiner-Elements** (macOS), and **Xmodmap** (Linux). Note: ctrl + Tabe / up / down is default for vscode tabs interactive menu and alt + Tab is default for Windows app switch interactive menu</small>

## Win: Auto Hot Key
```
`Win + R` → `type: shell:startup` (win_map.ahk as shortcut with admin [x])
```
- `Win` = `ALT` App switcher (default: alt)
* `ALT` = `CTRL` (VSCode, ctrl deafult for tab interactive menu, also keeps Up / Down)
- `WIN` + [`A`, `X`, `C`, `V`, `...`] = `CTRL`


## Mac: Karabiner-Elements
```
Karabiner > Complex modifications > add `karabiner.json`
```
- `CMD` + [`Delete`, `Left`, `Right`] = `CTRL` (word by word)
* `ALT` = `CTRL` (VSCode, ctrl deafult for tab interactive menu, also keeps Up / Down)

## Lnx: keyd (C) Xmodmap
```
Input Mapper > Keyboard > Keystrokes Preset
```
- `CMD` (App switcher Super + Shift + Tab`)
- `ALT` = `CTRL` (VSCode tab switcher)
- `CMD` = `CTRL` + [`A`, `X`, `C`, `V`]

# Keyboard Layouts

Default, on magickeyboard, fn => CapsLock

# VSCode Settings

Keybindings, cursor up and down 4 lines with ALT <= CMD

* `CMD` + [`Up`, `Down`] = `ALT` [`Up`, `Down`] Move cursor 4 lines (reason: VSCode interactive menu)
- `CMD` + [`Left`, `Right`] = `CTRL` + [`Left`, `Right`] (VSCode, up down move line)

Config (Zoom / formatter / tab layout)
Theme
