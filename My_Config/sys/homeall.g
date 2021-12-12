; homeall.g
; called to home all axes


G91                    ; relative positioning
G1 H2 Z5 F1800         ; lift Z relative to current position


G1 H1 X-315 Y305 F1800 ; move quickly to X and Y axis endstop and stop there (coarse home)
G1 H1 X-315 F1800      ; move quickly to X axis endstop and stop there (first pass)
G1 H1 Y305 F1800       ; move quickly to Y axis endstop and stop there (first pass)
G1 X5 Y-5 F1800        ; go back a few mm
G1 H1 X-315 F360       ; move slowly to X axis endstop once more (second pass)
G1 H1 Y305 F360        ; move slowly to Y axis endstop once more (second pass)


G90                ; absolute positioning
G1 X150 Y150 F1800 ; go to first probe point
M280 P0 S160       ; BLTouch Precautionary alarm release
M280 P0 S90        ; BLTouch Ensure the pin is raised
G30                ; home Z by probing the bed


; lift Z after probing
G91                ; relative positioning
G1 H2 Z5 F1800     ; lift Z relative to current position
G90                ; absolute positioning