M291 P"Wait while the nozzle is being heated up ..." R"Loading" T0
M568 R150 S220    ; set standby and active temp for current tool
M568 A2           ; set current tool to active state
M116              ; wait for the temperatures to be reached

M291 P"Feeding filament ..." R"Loading" T0
M83          ; place extruder in relative mode
G1 E75 F500  ; feed 75mm of filament at 500mm/min
G4 P1000     ; wait for nozzle pressure to ease off, P1000 = wait for one second
M291 P"Purge filament ..." R"Loading" T0
G1 E40 F100  ; purge

M400         ; wait for moves to complete
M568 A0      ; set current tool to off state
M291 P"Finished loading filament." R"Loading" T10
