; bed.g
; executed before each print; before any slicer code is run

T0                        ; ensure the tool is selected
M221 S100                 ; set extrusion factor back to 100% in case it was changed
M290 R0 S0                ; clear any baby-stepping
M106 P0 S0                ; turn layer fan off if it is on
M98 P"0:/sys/setspeeds.g" ; set speed and acceleration
M400                      ; finish all moves, clear the buffer
G32                       ; calibrate bed
M703                      ; invoke filament-specific config.g settings
G90                       ; absolute Positioning
M83                       ; extruder relative mode

; Slicer generated gcode takes it away from here ....