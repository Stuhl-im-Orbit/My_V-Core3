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
G1 X50 Y150 Z50 F3600 ; move to start position
G4 S4                 ; wait 4 sec to cool down
M956 P121.0 S1000 A0  ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)
G4 P10                ; wait 10ms to get a baseline for accelerometer
G1 X250 F36000        ; move to end position
G4 S4                 ; wait 4 sec before next test

; test y
M291 P"Capture accelerator data for Y movement" R"Capture accelerator data"
G1 X150 Y50 Z50 F3600 ; move to start position
G4 S4                 ; wait 4 sec to cool down
M956 P121.0 S1000 A0  ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)
G4 P10                ; wait 10ms to get a baseline for accelerometer
G1 Y250 F36000        ; move to end position
G4 S4                 ; wait 4 sec before next test

; test front left to back right
M291 P"Capture accelerator data for front left to back right movement" R"Capture accelerator data"
G1 X50 Y50 Z50 F3600  ; move to start position
G4 S4                 ; wait 4 sec to cool down
M956 P121.0 S1000 A0  ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)
G4 P10                ; wait 10ms to get a baseline for accelerometer
G1 X250 Y250 F36000   ; move to end position
G4 S4                 ; wait 4 sec before next test

; test front right to back left
M291 P"Capture accelerator data for front right to back left movement" R"Capture accelerator data"
G1 X250 Y50 Z50 F3600 ; move to start position
G4 S4                 ; wait 4 sec to cool down
M956 P121.0 S1000 A0  ; requests the accelerometer (P121.0) to collect 1000 samples (S1000) immediately (A0)
G4 P10                ; wait 10ms to get a baseline for accelerometer
G1 X50 Y250 F36000    ; move to end position

M292                  ; hide the message

; set back to normal speeds
M566 X600.00 Y600.00 Z6.00 E3600.00 P1     ; set maximum instantaneous speed changes (mm/min) and jerk policy
M203 X18000.00 Y18000.00 Z1200.00 E3600.00 ; set maximum speeds (mm/min)
M201 X2500.00 Y2500.00 Z100.00 E3600.00    ; set accelerations (mm/s^2)
