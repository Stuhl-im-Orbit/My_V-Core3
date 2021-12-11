; homex.g
; called to home the X axis

G91               ; relative positioning
G1 H2 Z5 F1800    ; lift Z relative to current position
G1 H1 X-315 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F1800       ; go back a few mm
G1 H1 X-315 F360  ; move slowly to X axis endstop once more (second pass)
G1 H2 Z-5 F1800   ; lower Z again
G90               ; absolute positioning
