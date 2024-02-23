; homex.g
; Called to home the X axis

G91                         ; Set to relative positioning
G1 H2 Z5 F3600              ; Lift Z relative to current position
M400                        ; Wait for all moves to finish
M201 X500 Y500              ; Reduce acceleration for homing moves
G1 H1 X-315 F3600           ; Move quickly to X axis endstop and stop there (first pass)
G1 X5 F360                  ; Go back a few mm
G1 H1 X-315 F360            ; Move slowly to X axis endstop once more (second pass)
M98 P"0:/sys/setspeeds.g"   ; Call script to set speed and acceleration
G1 H2 Z-5 F3600             ; Lower Z again
G90                         ; Set to absolute positioning