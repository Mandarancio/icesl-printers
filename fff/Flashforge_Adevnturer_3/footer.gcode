;*** FlashForge Adventurer 3 footer.gcode ***
M104 S0 T0   ; Set HB temperature to 0
M140 S0 T0   ; Set extruder temperature to 0
G162 Z F1800 ; Home Z
G28 X Y      ; Home XY Axis
M132 X Y A B ; Recall stored home offset 
M652         ; Black magic (???cd)
G91			 ; Set relative position
M18          ; Disable step motors
;*** End of footer.gcode ***