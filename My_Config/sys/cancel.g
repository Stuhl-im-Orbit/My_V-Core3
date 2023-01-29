; cancel.g
; called when M0 (Stop) is run (e.g. when a print is cancelled)

M568 P0 R-274 S-274  ; set standby and active temperatue of tool 0 to 0K
M140 S0 R0           ; set bed temperature to 0C
M140 S-274           ; set bed temperature to 0K to turn it off
G91                  ; set relaitive postitioning
G1 H2 Z5             ; lift z axis 5mm
G90                  ; set absolute postitioning
G1 X150 Y290 F7200.0 ; move to good position for check
M106 P0 S0           ; turn off layer fan
