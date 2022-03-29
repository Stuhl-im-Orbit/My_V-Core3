M291 P"Please wait while the nozzle is being heated up" R"Unloading PETG" T5
G10 S245 ; set current tool temperature
M116     ; wait for the temperatures to be reached

M291 P"Retracting filament..." R"Unloading PETG" T5
M83           ; place extruder in relative mode
G1 E-5 F3600  ; extract filament to cold end area
G4 P3000      ; wait for three seconds
G1 E5 F3600   ; push back the filament to smash any stringing
G1 E-15 F3600 ; extract back fast in to the cold zone
G1 E-130 F300 ; continue extraction slowly, allow the filament time to cool solid before it reaches the gears
M400          ; wait for moves to complete
M292          ; hide the message
G10 S0        ; turn off the heater