(*** FlashForge Creator Pro start.gcode ***)
M73 P0 (enable build progress)
G21 (set units to mm)
G90 (set positioning to absolute)
M82 (set extrusion mode to absolute)

(*** begin homing ***)
G162 X Y F2500 (home XY axes maximum)
G161 Z F1100 (home Z axis minimum)
G92 Z-5 (set Z to -5)
G1 Z0.0 (move Z to "0")
G161 Z F100 (home Z axis minimum)
M132 X Y Z A B (recall stored home offsets for XYZAB axis)
(*** end homing ***)

G130 X20 Y20 Z20 A20 B20 (lower stepper Vrefs while heating)

M127 (disable fan)
M140 S<HB_TEMP> T0 (set HB temperature)
M104 S<EX_TEMP> T0 (set extruder temperature)
M133 T0            (stabilize extruder temperature)

M134 T0 (wait for bed temp)

G130 X127 Y127 Z40 A127 B127 (set Stepper motor Vref to defaults)

G92 A0 B0 (zero extruders)
G0 Z0.4 (position nozzle to begin purge)

M135 T0 (select left tool - extruder 0)
G1 X-110 Y-70 F9000 (reposition nozzle)
G1 X-100 Y-70 A25 F300 (purge nozzle)
G1 X-110 Y-70 Z0.15 F1200 (slow wipe)
G1 X-100 Y-70 Z0.5 F1200 (lift)

G92 A0 B0 (zero extruders)

M73 P1 (notify GPX body has started)
(*** end of start.gcode ***)