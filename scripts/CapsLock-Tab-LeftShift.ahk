; Caps Lock → Tab, Hold Scroll Lock for 5 seconds → Caps Lock
; Useful for keyboards with a broken or missing tab key.
; Requires AutoHotkey v1.1+

#SingleInstance Force

scrollLockHoldDuration := 5000  ; ms (5 seconds)
scrollLockPressTime := 0

; --- Caps Lock sends Tab ---
CapsLock::Tab

; --- Hold Scroll Lock for 5 seconds to toggle Caps Lock ---
$ScrollLock::
    scrollLockPressTime := A_TickCount
    KeyWait ScrollLock
    holdDuration := A_TickCount - scrollLockPressTime
    if (holdDuration >= scrollLockHoldDuration) {
        SetCapsLockState % GetKeyState("CapsLock", "T") ? "Off" : "On"
    }
return

;;; Caps Lock → Tab, Double-press Left Shift → Caps Lock
;;; Requires AutoHotkey v1.1+
;;
;;#SingleInstance Force
;;
;;shiftDoublePressWindow := 400  ; ms
;;lastLShiftPress := 0
;;
;;; --- Caps Lock sends Tab ---
;;CapsLock::Tab
;;
;;; --- Double-press Left Shift toggles Caps Lock ---
;;; $ = don't retrigger when we Send LShift ourselves
;;$LShift::
;;    timeSinceLast := A_TickCount - lastLShiftPress
;;    if (lastLShiftPress > 0 && timeSinceLast < shiftDoublePressWindow) {
;;        SetCapsLockState % GetKeyState("CapsLock", "T") ? "Off" : "On"
;;        lastLShiftPress := 0
;;        return
;;    }
;;    lastLShiftPress := A_TickCount
;;    Send {LShift down}
;;    KeyWait LShift
;;    Send {LShift up}
;;return
;;
