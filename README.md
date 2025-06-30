# OpSys Standard Keyboard Map

##### Defines a custom keyboard remapping standard for improving productivity and consistency across platforms (Windows, macOS, Linux) and applications (e.g., VSCode).

## 1) CMD - Command - Left Win

##### **CMD / Win** Acts as a **primary platform modifier** for shortcuts (e.g., app switching, killing apps) and standard actions (e.g., copy, paste, move cursor).

### - Platform / Os Modifiers

1. Space: **App Finder Search**
2. Tab: **App-Switching**
3. Q: **Kill application**

### - Keystrokes - Standard shortcuts

1. Left / Right: **Move cursor word by word**
2. C / V / X / A / L / D: **Standard methods**
3. Delete: **Delete word to left** (supr | Fn)
4. **Console** standard behaviour (ctrl)

### - Vscode:

1. Up / Down: **Move 4 lines**
2. Enter: **New line below**
3. I: **Cursor to AI Chat**
4. B / Shift + ( X / E / P ): **Panel interactions** 

## 2) Option - Left Alt 

##### **Option / Alt** Used for **application-specific** shortcuts (e.g., brush size, selecting frames in VSCode)

### - Vscode:

1. Tab: **Inner tab**
2. Up / Down: **Grab & move line**
2. Shift + ( Up / Down ): **Duplicate up or down**
5. Numerics: **App frame selector**
<!-- 3. cmd + I (Copilot chat) -->

## 3) Control - Left Ctrl

##### Unused (bad touch typing) - helps remapping (extra key)

## 4) FN - Special key

##### **FN** Defines **special actions** like forward delete and moving the cursor to document edges (contained within level hardware / firmware).

### - Platform / Os Modifiers

1. Left / Right / Up / Down: **Move cursor to far end**
2. Delete: **Forward delete**

# Keyboard Remapping - OpSys

##### Platform-specific remapping instructions using tools like **AutoHotkey** (Windows), **Karabiner-Elements** (macOS), and **Xmodmap** (Linux).

## Win: Auto Hot Key
Win key = alt, alt = ctrl. 
```
`Win + R` → `type: shell:startup` (win_binding.ahk as shortcut)
```

## Mac: Karabiner-Elements
CTRL + [A, X, C, V]
CTRL + SHIFT + Arrows
Vscode config

Complex modifications > add `karabiner.json`

## Deb: Xmodmap

```bash
xmodmap ~/.Xmodmap
```

# VSCode Settings

Config (Zoom / formatter / tab layout)
Theme
