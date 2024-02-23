; homez.g
; Called to home the Z axis.

G91                        ; Set to relative positioning
G1 H2 Z5 F3600             ; Lift Z axis relative to current position
M400                       ; Wait for all moves to finish
G90                        ; Set to absolute positioning
G1 X150 Y150 F7200         ; Move to the first probe point
G30                        ; Home Z axis by probing the bed

; Lift Z axis after probing
G91                        ; Set to relative positioning
G1 H2 Z5 F3600             ; Lift Z axis relative to current position
G90                        ; Set to absolute positioning