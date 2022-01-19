; homex.g
; called to home the X axis

G91               ; relative positioning
G1 H2 Z5 F3600    ; lift Z relative to current position
M400              ; wait for all moves to finish
G1 H1 X-315 F3600 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F3600       ; go back a few mm
G1 H1 X-315 F360  ; move slowly to X axis endstop once more (second pass)
G1 H2 Z-5 F3600   ; lower Z again
G90               ; absolute positioning
