M291 P"Please wait while the nozzle is being heated up ..." R"Unloading" T0
M568 R150 S220    ; set standby and active temp for current tool
M568 A2           ; set current tool to active state
M116              ; wait for the temperatures to be reached

M291 P"Retracting filament ..." R"Unloading" T0
M83           ; place extruder in relative mode
G0 E10 F300   ; Extrude a little bit
G1 E-5 F3600  ; extract filament to cold end area
G4 P3000      ; wait for three seconds
G1 E5 F3600   ; push back the filament to smash any stringing
G1 E-15 F3600 ; extract back fast in to the cold zone
G1 E-100 F300 ; continue extraction slowly, allow the filament time to cool solid before it reaches the gears

M400         ; wait for moves to complete
M568 A0      ; set current tool to off state
M291 P"Finished unloading filament." R"Unloading" T10
