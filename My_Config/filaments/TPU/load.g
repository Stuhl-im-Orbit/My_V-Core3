M291 P"Please wait while the nozzle is being heated up" R"Loading TPU" T5
G10 S220 ; set current tool temperature to 220C
M116     ; wait for the temperatures to be reached

M291 P"Feeding filament..." R"Loading TPU" T5
M83          ; place extruder in relative mode
G1 E100 F600 ; feed 100mm of filament at 600mm/min
G4 P1000     ; wait for nozzle pressure to ease off, P1000 = wait for one second
G1 E40 F100  ; purge
M400         ; wait for moves to complete
M292         ; hide the message
G10 S0       ; turn off the heater
