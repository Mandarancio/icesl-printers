(*** FlashForge Creator Pro end.gcode ***)
M73 P100 ( End  build progress )

M104 S0 T0 ( Set HB temperature to 0)
M109 S0 T0 ( Cool down the build platform )
M140 S0 T0 ( Set Extruder temperature to 0)

M107 ( Stop blower fan )

G162 Z F1800 (Home Z)
G28 X Y (Move XY to origin)

M652 (No idea)

M132 X Y Z A B (recall stored home offsets for XYZAB axis)

M18 (disable steppers)
(*** end of end.gcode ***)
