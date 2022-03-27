; homeall.g
; called to home all axes


G91                    ; relative positioning
G1 H2 Z5 F3600         ; lift Z relative to current position
M400                   ; wait for all moves to finish

M201 X500 Y500         ; reduce acceleration for homing moves

G1 H1 X-310 F3600      ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F360             ; go back a few mm
G1 H1 X-310 F360       ; move slowly to X axis endstop once more (second pass)

G1 H1 Y305 F3600       ; move quickly to Y axis endstop and stop there (first pass)
G1 Y-5 F360            ; go back a few mm
G1 H1 Y305 F360        ; move slowly to Y axis endstop once more (second pass)

M201 X3000 Y3000       ; return to full acceleration

G90                    ; absolute positioning
G1 X150 Y150 F3600     ; go to first probe point
G30                    ; home Z by probing the bed


; lift Z after probing
G91                    ; relative positioning
G1 H2 Z5 F3600         ; lift Z relative to current position
G90                    ; absolute positioning
