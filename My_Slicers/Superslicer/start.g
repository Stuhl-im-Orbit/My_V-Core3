M104 S150                           ; pre heat hotend to no-ooze temp, no wait
M190 S[first_layer_bed_temperature] ; heat bed to setting and wait
G29                                 ; mesh bed leveling
G1 X150 Y10 Z100 F7200.0            ; move to good position for nozzle cleaning and check
M109 S{first_layer_temperature[initial_extruder]+extruder_temperature_offset[initial_extruder]} ; heat hotend and wait
G1 X1 Y20 Z0.3 F7200.0              ; move to start position
G92 E0                              ; reset extruder
G1 X1.1 Y200.0 Z0.3 F1500.0 E15     ; draw the first line
G1 X1.4 Y200.0 Z0.3 F7200.0         ; move to side a little
G1 X1.4 Y40 Z0.3 F1500.0 E30        ; draw the second line (a little shorter)
G92 E0                              ; reset extruder
G1 Z2.0 F1000                       ; move Z axis up little to prevent scratching of heat Bed
G1 X5 Y40 Z0.3 F7200.0              ; move over to prevent blob squish
