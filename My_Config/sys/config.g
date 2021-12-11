; config.g
; executed by the firmware on start-up


; configuration for V-Core 3 300x300 with
; ... Duet 3 Mini 5+ Wifi
; ... Duet 3 Toolboard 1LC (on default CAN ID #121)
; ... Duet Paneldue 7i
; ... Duet Rotating Magnet Filament Monitor
; ... BLTouch v3.1
; ... custom Keenovo silicone heater pad 280x280 (600W) 220V
; ... Keenovo C-Lin SSR 40A440VAC solid state relay
; ... Slice Engineering Mosquito hotend
; ... Slice Engeneering 300C high temperature thermistor for hotend
; ... BondTech LGX extruder
; ... Steppers X,Y and Z: LDO 1.8 48mm LDO-42STH47-2504AC (current rating: 2.5A/Phase)


; General preferences
M111 S0                                                                  ; debug off
M929 P"eventlog.txt" S1                                                  ; start logging to file eventlog.txt; level is warning
G4 S3                                                                    ; wait for tool board to start
M575 P1 S1 B115200                                                       ; enable support for PanelDue
575 P0 B250000                                                           ; set baud rate for USB port
G21                                                                      ; work in millimeters
G90                                                                      ; send absolute coordinates...
M83                                                                      ; ...but relative extruder moves
M669 K1                                                                  ; select CoreXY mode


; Network
M550 P"V-Core 3"                                                         ; set printer name
M551 Preprap                                                             ; set password, reprap for no password prompt
M552 S1                                                                  ; enable network
M586 P0 S1                                                               ; enable HTTP
M586 P1 S0                                                               ; disable FTP
M586 P2 S0                                                               ; disable Telnet


; Drives
M569 P0.0 S1 D3                                                          ; physical drive 0.0 goes forwards use stealthChop2 (Z left)
M569 P0.1 S1 D3                                                          ; physical drive 0.1 goes forwards use stealthChop2 (Z back)
M569 P0.2 S1 D3                                                          ; physical drive 0.2 goes forwards use stealthChop2 (Z right)
M569 P0.3 S1 D3                                                          ; physical drive 0.3 goes forwards use stealthChop2 (Y)
M569 P0.4 S1 D3                                                          ; physical drive 0.4 goes forwards use stealthChop2 (X)
M569 P121.0 S1 D3                                                        ; physical drive 121.0 goes forwards use stealthChop2 (Extruder)
M584 X0.4 Y0.3 Z0.0:0.1:0.2 E121.0                                       ; set drive mapping
M350 X16 Y16 Z16 E16 I1                                                  ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E400.00                                        ; set steps per mm
M566 X600.00 Y600.00 Z60.00 E600.00 P1                                   ; set maximum instantaneous speed changes (mm/min) and jerk policy
M203 X10800.00 Y10800.00 Z1000.00 E3600.00                               ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 E3600.00                                  ; set accelerations (mm/s^2)
M906 X1500 Y1500 Z1500 E600 I30                                          ; set motor currents (mA, 60 to 90 per cent of current rating) and motor idle factor in per cent
M84 S30                                                                  ; Set idle timeout


; Axis Limits
M208 X0 Y0 Z0 S1                                                         ; set axis minima
M208 X310 Y300 Z300 S0                                                   ; set axis maxima


; Endstops
M574 X2 S1 P"121.io2.in"                                                 ; configure switch-type (e.g. microswitch) endstop for high end on X via pin io2.in on tool board
M574 Y2 S1 P"io1.in"                                                     ; configure switch-type (e.g. microswitch) endstop for high end on Y via pin io0.in
M574 Z1 S2                                                               ; configure Z-probe endstop for low end on Z


; Z-Probe
M950 S0 C"121.io0.out"                                                   ; create servo pin 0 for BLTouch on tool board
M558 P9 C"121.io0.in" H5 F120 T6000 A5                                   ; set Z probe type to bltouch and the dive height + speeds on tool board
G31 P500 X-28 Y-13 Z0.9                                                  ; set Z probe trigger value, offset and trigger height
M671 X-4.5:150:304.5 Y-4.52:305:-4.52 S5                                 ; define positions of Z leadscrews, 5mm maximum correction
M557 X20:280 Y20:280 P5                                                  ; define 5x5 mesh grid


; Heaters and temperature sensors
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed"                      ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0 Q10                                                   ; create bed heater output on out0 and map it to sensor 0, 10Hz PWM frequency (AC via SSR for bed heater)
M307 H0 B0 S1.00                                                         ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                                  ; map heated bed to heater 0
M143 H0 S110                                                             ; set temperature limit for heater 0 to 110C

; !!! Run bed PID tune with "M303 H0 S70" and replace M307 below with
; !!! the result, we have AC heated bed, therefore omit Vnnn
; M307 H0 B0 R0.487 C383.6 D2.05 S1.00

M308 S1 P"121.temp0" Y"thermistor" T100000 B4680 C6.455513e-8  A"Hotend" ; configure sensor 1 as thermistor on pin temp0 on tool board (slice engineering 300C)
M950 H1 C"121.out0" T1                                                   ; create nozzle heater output on out0 on toolboard and map it to sensor 1
M307 H1 B0 S1.00                                                         ; disable bang-bang mode for heater and set PWM limit
M143 H1 S280                                                             ; set temperature limit for heater 1 to 280C

; !!! Run nozzle heater PID Tune with "M303 H0 S220" and replace
; !!!  M307 below with the result
; M307 H1 B0 R1.620 C183.6 D7.36 S1.00 V24.0


; Fans
M950 F0 C"121.out1" Q250                                                 ; create fan 0 on pin out1 on tool board and set its frequency
M106 P0 C"Layer Fan" S1 H-1                                              ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"121.out2" Q250                                                 ; create fan 1 on pin out2 on tool board and set its frequency
M106 P1 C"Hotend Fan" S1 H1 T45 L255                                     ; set fan 1 value. Thermostatic control is turned on


; Tools
M563 P0 S"Mosquito" D0 H1 F0                                             ; define tool 0 with extruder drive 0 heater 1 and fan 0
G10 P0 X0 Y0 Z0                                                          ; set tool 0 axis offsets
G10 P0 R0 S0                                                             ; set initial tool 0 active and standby temperatures to 0C
M302 S180 R180                                                           ; allow extrusion starting from 180C and retractions already from 180C


; Accelerometer
M955 P121.0 I12                                                          ; Accelerometer on tool board, oriented counter clockwise 90


; Filament Monitor
M591 D0 P3 C"121.io1.in" S1 R70:130 L24.8 E3.0                           ; Duet3D rotating magnet sensor for extruder drive 0 is connected to io1.in on tool board,
                                                                         ; enabled, 70% to 130% tolerance, sensitivity 24.8mm.rev, 3mm detection length

; misc settings
M404 N1.75 D0.4                                                          ; set filament width and nozzle diameter
M572 D0 S0.10                                                            ; set extruder pressure advance amount
M593 F60                                                                 ; dynamic acceleration, vary acceleration to cancel ringing at specified frequency in Hz
M501                                                                     ; load saved parameters from config-override.g
T0                                                                       ; select tool 0
