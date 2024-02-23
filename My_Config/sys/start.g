; start.g
; Executed before each print; before any slicer code is run

T0                          ; Ensure the tool is selected
M221 S100                   ; Set extrusion factor back to 100% in case it was changed
M290 R0 S0                  ; Clear any baby-stepping
M106 P0 S0                  ; Turn layer fan off if it is on
M98 P"0:/sys/setspeeds.g"   ; Set speed and acceleration
M400                        ; Finish all moves, clear the buffer
M703                        ; Invoke filament-specific config.g settings
G90                         ; Set to absolute positioning
M83                         ; Set extruder to relative mode

; Slicer-generated G-code takes over from here ...
; Ensure that G32 (bed leveling) and G29 (mesh bed leveling) is included in the slicer startup cod