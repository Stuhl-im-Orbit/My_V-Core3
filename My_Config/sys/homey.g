; homey.g
; Called to home the Y axis.

G91                          ; Set to relative positioning
G1 H2 Z5 F3600               ; Lift Z relative to the current position
M400                         ; Wait for all moves to finish
M201 X500 Y500               ; Reduce acceleration for homing moves
G1 H1 Y305 F3600             ; Move quickly to Y axis endstop and stop there (first pass)
G1 Y-5 F360                  ; Go back a few mm
G1 H1 Y305 F360              ; Move slowly to Y axis endstop once more (second pass)
M98 P"0:/sys/setspeeds.g"    ; Call the macro to set speed and acceleration
G1 H2 Z-5 F3600              ; Lower Z again
G90                          ; Set to absolute positioning