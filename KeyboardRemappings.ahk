#Requires AutoHotkey v2.0.11+                               ; Always have a version requirment

#q::Send("!{F4}") ; Win+q = alt+F4

*CapsLock::double_tap_caps()                                ; Double tap to use caps  

#HotIf GetKeyState('CapsLock', 'P')                         ; Following hotkeys are enabled when caps is held

; Custom shortcuts
x::Send("^+!x") ; Ctrl+Shift+Alt+x
z::Send("^+!z") ; Ctrl+Shift+Alt+z

; System controls
1::Volume_Down
2::Volume_Up
3::Volume_Mute

; Editing text utilities
w::Up
a::Left
s::Down
d::Right
q::Home
e::End
BackSpace::Delete

#HotIf                                                      ; Always reset #HotIf directive when done

double_tap_caps() {
    static last := 0                                        ; Last time caps was tapped
        , threshold := 200                                  ; Speed of a double tap in ms
    if (A_TickCount - last < threshold)                     ; If time since last press is within double tap threshold
        toggle_caps()                                       ;   Toggle caps state
        ,last := 0                                          ;   Reset last to 0 (prevent triple tap from activating it again)
    else last := A_TickCount                                ; Else not a double tap, update last tap time
    return
    
    toggle_caps() {
        state := GetKeyState('CapsLock', 'T')               ; Get current caps toggle state
        SetCapsLockState('Always' (state ? 'Off' : 'On'))   ; Set it to the opposite
    }
}