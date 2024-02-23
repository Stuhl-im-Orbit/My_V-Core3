; config.g
; Executed by the firmware on start-up

; RepRapFirmware 3.4.6 configuration for V-Core 3 300x300 with:
; - Duet 3 Mini 5+ Wifi
; - Duet 3 Toolboard 1LC (on default CAN ID #121)
; - Duet Paneldue 7i
; - Super PINDA
; - Keenovo silicone heater pad 280x280 (600W) 220V
; - Keenovo C-Lin SSR 40A440VAC solid state relay
; - Trianglelab Dragon Hotend - High Flow
; - Semitec 104 GT2 thermistor for hotend
; - BondTech LGX Lite extruder (e-steps value: 562 using 16 microsteps, stepper 1.8, current rating: 1A/Phase)
; - Steppers X,Y, and Z: LDO 1.8 48mm LDO-42STH47-2504AC (current rating: 2.5A/Phase)

; General preferences
M111 S0                                                                   ; Debug off
M929 P"eventlog.txt" S1                                                   ; Start logging to file eventlog.txt; level is warning
G4 S3                                                                     ; Wait for tool board to start
M575 P1 S1 B115200                                                        ; Enable support for PanelDue
M575 P0 B250000                                                           ; Set baud rate for USB port
G21                                                                       ; Work in millimeters
G90                                                                       ; Send absolute coordinates...
M83                                                                       ; ...but relative extruder moves
M669 K1                                                                   ; Select CoreXY mode
M550 P"VCore3"                                                            ; Set printer name

; Network (comment the whole block if using Raspberry Pi, i.e., SBC mode)
M551 P"reprap"                                                            ; Set password; "reprap" for no password prompt
M552 S1                                                                   ; Enable network
M586 P0 S1                                                                ; Enable HTTP
M586 P1 S0                                                                ; Disable FTP
M586 P2 S0                                                                ; Disable Telnet

; Drives
M569 P0.0 S0 D2                                                           ; Physical drive 0.0 goes backwards; use spread cycle (Z left)
M569 P0.1 S0 D2                                                           ; Physical drive 0.1 goes backwards; use spread cycle (Z back)
M569 P0.2 S0 D2                                                           ; Physical drive 0.2 goes backwards; use spread cycle (Z right)
M569 P0.3 S1 D2                                                           ; Physical drive 0.3 goes forwards; use spread cycle (Y)
M569 P0.4 S1 D2                                                           ; Physical drive 0.4 goes forwards; use spread cycle (X)
M569 P121.0 S0 D2                                                         ; Physical drive 121.0 goes backwards; use spread cycle (extruder)
M584 X0.4 Y0.3 Z0.0:0.1:0.2 E121.0                                        ; Set drive mapping
M350 X16 Y16 Z16 E16 I1                                                   ; Configure microstepping @16 with interpolation
M92 X80.00 Y80.00 Z800.00 E570.56                                         ; Set steps per mm @16 microstepping
M98 P"0:/sys/setspeeds.g"                                                 ; Set speed and acceleration
M906 X1600 Y1600 Z1600 E800 I30                                           ; Set motor peak currents and motor idle factor in percent
M84 S30                                                                   ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                                          ; Set axis minima
M208 X310 Y300 Z300 S0                                                    ; Set axis maxima

; Endstops
M574 X1 S1 P"121.io2.in"                                                  ; Configure switch-type (e.g., microswitch) endstop for high end on X via pin io2.in on tool board
M574 Y2 S1 P"io4.in"                                                      ; Configure switch-type (e.g., microswitch) endstop for high end on Y via pin io4.in
M574 Z1 S2                                                                ; Configure Z-probe endstop for low end on Z

; Z-Probe
M558 P8 C"121.io0.in" H3 F360:180 T18000 A6 S0.02                         ; Z probe Super PINDA
G31 P500 X-28 Y-13 Z1.21                                                  ; Set Z probe trigger value, offset, and trigger height. More Z means closer to the bed
M671 X-4.5:150:304.5 Y-4.52:305:-4.52 S5                                  ; Define positions of Z leadscrews, 5mm maximum correction
M557 X20:280 Y20:280 P7                                                   ; Define 7x7 mesh grid

; Heaters and temperature sensors
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed"                       ; Configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0 Q11                                                    ; Create bed heater output on out0 and map it to sensor 0 PWM 11Hz SSR
M307 H0 B0 S1.00                                                          ; Disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                                   ; Map heated bed to heater 0
M143 H0 S110                                                              ; Set temperature limit for heater 0 to 110C

; !!! Initiate the bed PID tuning process using the command: "M303 H0 S80". 
; !!! Replace the existing M307 command below with the result.
M307 H0 R0.594 K0.265:0.000 D5.82 E1.35 S1.00 B0
M308 S1 P"121.temp0" Y"thermistor" T100000 B4725 C7.06e-8 A"Hotend"       ; Configure sensor 1 as thermistor on pin temp0 on tool board (Semitec 104 GT2)
M950 H1 C"121.out0" T1                                                    ; Create nozzle heater output on out0 on toolboard and map it to sensor 1
M307 H1 B0 S1.00                                                          ; Disable bang-bang mode for heater and set PWM limit
M143 H1 S285                                                              ; Set temperature limit for heater 1 to 285C

; !!! Initiate the nozzle heater PID tuning process using the command: "M303 H1 S240".
; !!! Ensure that the nozzle is positioned approximately 1mm above the bed
; !!! and that the part cooling fan is set to 25% speed (M106 S64).
; !!! Replace the M307 command below with the result.
M307 H1 R2.841 K0.612:0.000 D5.58 E1.35 S1.00 B0 V24.0
; Fans
M950 F0 C"121.out1" Q100                                                  ; Create fan 0 on pin out1 on tool board and set its frequency
M106 P0 C"Layer Fan" S0 H-1                                               ; Set fan 0 value. Thermostatic control is turned off
M950 F1 C"121.out2" Q100                                                  ; Create fan 1 on pin out2 on tool board and set its frequency
M106 P1 C"Tool Fan" S1 H1 T35                                             ; Set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 S"DragonHF" D0 H1 F0                                              ; Define tool 0 with extruder drive 0 heater 1 and fan 0
G10 P0 X0 Y0 Z0                                                           ; Set tool 0 axis offsets
G10 P0 R0 S0                                                              ; Set initial tool 0 active and standby temperatures to 0C
M302 S180 R180                                                            ; Allow extrusion starting from 180C and retractions already from 180C

; Accelerometer
M955 P121.0 I16                                                           ; Accelerometer on tool board, orientation (https://www.dropbox.com/s/hu2w5mk57l4zqpg/Accelerometer%20Orientation.pdf)

; Mainboard Sensor
M308 S2 P"mcutemp" Y"mcutemp" A"Duet Board"                               ; Configure MCU sensor (may work or not, depends on batch of hw)

; Misc Settings
M404 N1.75                                                                ; Set filament width
M593 P"MZV" F48.5 S0.07                                                   ; Input shaping, vary acceleration to cancel ringing at specified frequency in Hz
M501                                                                      ; Load saved parameters from config-override.g
T0                                                                        ; Select tool 0