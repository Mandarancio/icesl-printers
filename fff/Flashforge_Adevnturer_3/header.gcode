;*** FlashForge Adventurer 3 header.gcode ***
;layer_height: <LY_HEIGHT>
;perimeter_shells: <PERIMITER>
;top_solid_layers: <TOP_LAYER>
;bottom_solid_layers: <BOTTOM_LAYER>
;fill_density: <FILL>
;fill_pattern: <FILL_PATTERN>
;base_print_speed: <BASE_SPEED>
;travel_speed: <TRAVEL_SPEED>
;right_extruder_temperature: <EX_TEMP>
;platform_temperature: <HB_TEMP>

;start gcode

M118 X25.55 Y25.55 Z21.00 T0
M140 S<HB_TEMP> T0           ; Set HB temperature
M104 S<EX_TEMP> T0			 ; Set extruder temperature
M104 S0 T1					 ; Disable second extruder (precautuin)
M107						 ; Fan OFF
G90							 ; Set absolute position

;homing
G28							 ; Move to home						
M132 X Y Z A B			     ; Load home offsets
G1 Z50.000 F420				 ; Move Z in position
G161 X Y F3300			     ; Home axis to minimum
M7 T0						 ; Black magic (??)
M6 T0						 ; Black magic (??)
M651						 ; Execute peel move
M907 X100 Y100 Z40 A80 B20   ; Init motors

;*** end of header.gcode ***