bed_size_x_mm = 150
bed_size_y_mm = 150
bed_size_z_mm = 150

nozzle_diameter_mm = 0.4
filament_diameter_mm = 1.75

extruder_count = 1

priming_mm_per_sec = 40

z_layer_height_mm_min = 0.1
z_layer_height_mm_max = 0.4

print_speed_mm_per_sec_min = 5
print_speed_mm_per_sec_max = 100

bed_temp_degree_c_min = 0
bed_temp_degree_c_max = 100
bed_temp_degree_c     = 50

perimeter_print_speed_mm_per_sec_min = 5
perimeter_print_speed_mm_per_sec_max = 100

first_layer_print_speed_mm_per_sec = 30
first_layer_print_speed_mm_per_sec_min = 5
first_layer_print_speed_mm_per_sec_max = 100

for i=0,63,1 do
  _G['filament_diameter_mm_'..i] = 1.75
  _G['filament_priming_mm_'..i] = 3.0
  _G['extruder_temp_degree_c_' ..i] = 210
  _G['extruder_temp_degree_c_'..i..'_min'] = 150
  _G['extruder_temp_degree_c_'..i..'_max'] = 240
  _G['extruder_mix_count_'..i] = 1
end
