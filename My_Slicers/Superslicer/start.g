M104 S150                           ; pre heat hotend to no-ooze temp, no wait
M190 S[first_layer_bed_temperature] ; heat bed to setting and wait
G29                                 ; mesh bed leveling
G1 X150 Y10 Z100 F18000             ; move to good position for nozzle cleaning and check
M109 S{first_layer_temperature[initial_extruder]+extruder_temperature_offset[initial_extruder]} ; heat hotend and wait
; --- prime blob start ---
G90                                        ; absolut positioning
M83                                        ; extruder relative mode
G1 Z5 F1000                                ; lift z 5mm
G1 X5 Y5 Z0.5 F18000                       ; move to blob position
G1 F60 E20                                 ; extrude a blob
M106 P0 S102                               ; 40% fan
G1 Z5 F100 E5                              ; move up by 5mm while extruding, breaks away from blob
G1 F200 Y30 E1                             ; move to wipe position, keep extruding so the wipe is attached to blob
G1 F200 Y50 Z0.2 E0.5                      ; go down diagonally while extruding
M106 P0 S0                                 ; fan off
G1 F200 Y60 Z0.2 E0.6                      ; small wipe line
G1 F18000 Y105                             ; break away wipe
; --- prime blob end ---
