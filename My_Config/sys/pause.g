; pause.g
; Called when a print from the SD card is paused.

M83              ; Set extruder to relative mode
G1 E-1 F3600     ; Retract 1mm of filament
G91              ; Set to relative positioning
G1 H2 Z5         ; Lift Z axis by 5mm
G90              ; Set to absolute positioning
G1 X150 Y0 F7200 ; Move to X=150 Y=0