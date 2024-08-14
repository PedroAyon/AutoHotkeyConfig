#Requires AutoHotkey v2.0.11+                               ; Always have a version requirment

#q::Send("!{F4}") ; Win+q = alt+F4

*CapsLock::return  ; Disable CapsLock key by default

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
c::toggle_caps()

#HotIf                                                      ; Always reset #HotIf directive when done

toggle_caps() {
    state := GetKeyState('CapsLock', 'T')               ; Get current caps toggle state
    SetCapsLockState('Always' (state ? 'Off' : 'On'))   ; Set it to the opposite
}