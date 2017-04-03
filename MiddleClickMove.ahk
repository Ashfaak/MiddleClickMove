; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

#NoEnv          ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2         ; A window's title can contain WinTitle anywhere inside it to be a match.

MouseIsOverTitlebar() {
    static WM_NCHITTEST := 0x84, HTCAPTION := 2
    CoordMode Mouse, Screen
    MouseGetPos x, y, w
    if WinExist("ahk_class Shell_TrayWnd ahk_id " w)  ; Exclude taskbar.
        return false
    SendMessage WM_NCHITTEST,, x | (y << 16),, ahk_id %w%
    WinExist("ahk_id " w)  ; Set Last Found Window for convenience.
    return ErrorLevel = HTCAPTION
}

#If MouseIsOverTitlebar()
~MButton::
CoordMode Mouse, screen
MouseGetPos x, y, w
Winactivate (ahk_id %w%)
; WinGetPos WinX, WinY, Width, Height, ahk_id %w%
; Yr := y - WinY
; if (Yr < 20)
send #+{Right} ;sends Windowskey + Shift + Right arrow
; return

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
