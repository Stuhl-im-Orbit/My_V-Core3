; homeall.g
; Called to home all axes

G91                         ; Set to relative positioning
G1 H2 Z5 F3600              ; Lift Z relative to current position
M400                        ; Wait for all moves to finish

M201 X500 Y500              ; Reduce acceleration for homing moves

G1 H1 X-315 F3600           ; Move quickly to X axis endstop and stop there (first pass)
G1 X5 F360                  ; Go back a few mm
G1 H1 X-315 F360            ; Move slowly to X axis endstop once more (second pass)

G1 H1 Y305 F3600            ; Move quickly to Y axis endstop and stop there (first pass)
G1 Y-5 F360                 ; Go back a few mm
G1 H1 Y305 F360             ; Move slowly to Y axis endstop once more (second pass)

M98 P"0:/sys/setspeeds.g"   ; Set speed and acceleration

G90                         ; Set to absolute positioning
G1 X150 Y150 F7200          ; Go to first probe point
G30                         ; Home Z by probing the bed