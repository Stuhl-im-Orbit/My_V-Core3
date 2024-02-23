; resume.g
; Called before a print from the SD card is resumed.

M116                  ; Wait for temperatures to stabilize
G1 R1 X0 Y0 Z5 F3600  ; Move to 5mm above the position of the last print move
G1 R1 X0 Y0 Z0        ; Return to the position of the last print move
M83                   ; Set relative extruder moves
G1 E10 F3600          ; Extrude 10mm of filament