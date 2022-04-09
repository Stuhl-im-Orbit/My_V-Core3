; get acceleration data you will find CSV files for analysis in
; Settings -> Machine-Specific -> in tab ACCELEROMETER

G28          ; home all
M593 P"none" ; disable shaper

; high speeds required for accelerometer tests
M566 X1200.00 Y1200.00 Z6.00 E3600.00 P1   ; set maximum instantaneous speed changes (mm/min)
M203 X48000.00 Y48000.00 Z1200.00 E3600.00 ; set maximum speeds (mm/min)
M201 X6000.00 Y6000.00 Z100.00 E3600.00    ; set accelerations (mm/s^2)

; test x
M291 P"Capture accelerator data for X movement" R"Capture accelerator data"
G1 X5 Y150 Z20 F7200      ; move to start position
G4 S4                     ; wait 4 sec to cool down
M956 P121.0 S1000 A0      ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)
G4 P10                    ; wait 10ms to get a baseline for accelerometer
G1 X295 F36000            ; move to end position
G4 S4                     ; wait 4 sec before next test

; test y
M291 P"Capture accelerator data for Y movement" R"Capture accelerator data"
G1 X150 Y5 Z20 F3600      ; move to start position
G4 S4                     ; wait 4 sec to cool down
M956 P121.0 S1000 A0      ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)
G4 P10                    ; wait 10ms to get a baseline for accelerometer
G1 Y295 F36000            ; move to end position
G4 S4                     ; wait 4 sec before next test

; test x after stop
M291 P"Capture accelerator data for X stop" R"Capture accelerator data"
G1 X5 Y150 Z20 F7200      ; move to start position
G4 S4                     ; wait 4 sec to cool down
G1 X295 F36000            ; move to end position
M400                      ; finish move
M956 P121.0 S1000 A0      ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)
G4 S4                     ; wait 4 sec before next test

; test y after stop
M291 P"Capture accelerator data for Y stop" R"Capture accelerator data"
G1 X150 Y5 Z20 F3600      ; move to start position
G4 S4                     ; wait 4 sec to cool down
G1 Y295 F36000            ; move to end position
M400                      ; finish move
M956 P121.0 S1000 A0      ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)

M292                      ; hide the message

M98 P"0:/sys/setspeeds.g" ; set speed and acceleration