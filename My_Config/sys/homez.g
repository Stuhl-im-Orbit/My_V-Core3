; homez.g
; called to home the Z axis

G91                ; relative positioning
G1 H2 Z5 F1800     ; lift Z relative to current position
G90                ; absolute positioning
G1 X150 Y150 F1800 ; go to first probe point
M280 P0 S160       ; BLTouch Precautionary alarm release
M280 P0 S90        ; BLTouch Ensure the pin is raised
G30                ; home Z by probing the bed

; lift Z after probing
G91                ; relative positioning
G1 H2 Z5 F1800     ; lift Z relative to current position
G90                ; absolute positioning
