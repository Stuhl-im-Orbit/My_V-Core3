; homez.g
; called to home the Z axis

G91                ; relative positioning
G1 H2 Z5 F3600     ; lift Z relative to current position
M400               ; wait for all moves to finish
G90                ; absolute positioning
G1 X150 Y150 F3600 ; go to first probe point
G30                ; home Z by probing the bed

; lift Z after probing
G91                ; relative positioning
G1 H2 Z5 F3600     ; lift Z relative to current position
G90                ; absolute positioning
