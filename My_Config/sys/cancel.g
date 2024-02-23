; cancel.g
; Called when M0 (Stop) is run, for example when a print is canceled.

M568 P0 R-274 S-274  ; Set standby and active temperature of tool 0 to 0K
M140 S0 R0           ; Set bed temperature to 0°C
M140 S-274           ; Set bed temperature to 0K to turn it off
G91                  ; Set relative positioning
G1 H2 Z5             ; Lift Z axis 5mm
G90                  ; Set absolute positioning
G1 X150 Y290 F7200.0 ; Move to a good position for check
M106 P0 S0           ; Turn off layer fan