; calibrate_z_probe_offset.g
; macro used to calculate the Z-Probe Z offset

G31 P100 X0 Y0 Z0      ; reset Z trigger height to 0mm
M290 R0 S0             ; clear baby stepping
G29 S2                 ; clear bed mesh
G1 X178 Y163 Z15 F1800 ; move to probing point (X150, Y150), including probe offset
G30                    ; probe to find a rough Z 0mm
G1 X150 Y150 Z1 F900   ; move the nozzle to 150,150,1 slow
M564 S0                ; allow movement outside axis limits
M291 P"Lower nozzle until it holds a sheet of paper. Click to continue." S2 Z1
G92 Z0.10              ; define this point as 0.10mm
M564 S1                ; disallow movement outside axis limits
G1 X150 Y150 F1800     ; move to probing point (X150, Y150)
G30 S-1                ; probe and report the trigger height
