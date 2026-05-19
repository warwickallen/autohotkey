; Caps Lock → Tab, Hold Left Shift for 3 seconds → Caps Lock
; Requires AutoHotkey v1.1+

#SingleInstance Force

shiftHoldDuration := 3000  ; ms (3 seconds)
lShiftPressTime := 0

; --- Caps Lock sends Tab ---
CapsLock::Tab

; --- Hold Left Shift for 3 seconds to toggle Caps Lock ---
; $ = don't retrigger when we Send LShift ourselves
$LShift::
    lShiftPressTime := A_TickCount
    Send {LShift Down}
    KeyWait LShift
    Send {LShift Up}
    holdDuration := A_TickCount - lShiftPressTime
    if (holdDuration >= shiftHoldDuration) {
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
