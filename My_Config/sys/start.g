
; bed.g
; executed before each print; before any slicer code isr run

T0           ; ensure the tool is selected
M572 D0 S0.0 ; clear pressure advance
M220 S100    ; set speed factor back to 100% in case it was changed
M221 S100    ; set extrusion factor back to 100% in case it was changed
M290 R0 S0   ; clear any baby-stepping
M106 P0 S0   ; turn layer fan off if it is on
G32          ; execute bed.g (level gantry)
G29          ; mesh bed leveling
M566 P1      ; jerk between all moves
M400         ; finish all moves, clear the buffer
G90          ; absolute Positioning
M83          ; extruder relative mode
; Slicer generated gcode takes it away from here ....
