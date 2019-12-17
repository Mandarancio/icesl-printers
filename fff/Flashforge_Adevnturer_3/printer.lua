-- Ultimaker 2
-- Sylvain Lefebvre  2014-03-08

reset_e_on_next_prime = false
extruder_e = 0
extruder_e_reset = 0

bed_origin_x = bed_size_x_mm / 2.0
bed_origin_y = bed_size_y_mm / 2.0

current_extruder = 0
current_frate = 0
current_fan_speed = -1
current_z = 0

function comment(text)
  output('; ' .. text)
end

function to_mm_cube(e)
  local r = filament_diameter_mm[extruders[0]] / 2
  return math.pi * r * r * e
end

function round(number, decimals)
  local power = 10^decimals
  return math.floor(number * power) / power
end


function header()
  local h = file('header.gcode')
  h = h:gsub( '<HB_TEMP>', bed_temp_degree_c )
  h = h:gsub( '<EX_TEMP>', extruder_temp_degree_c[extruders[0]])
  output(h)
end

function footer()
    output(file('footer.gcode'))
end


function retract(extruder,e)
  extruder_e = e
  output('G10')
  return e
end

function prime(extruder,e)
  extruder_e = e
  output('G11')
  if reset_e_on_next_prime == true then
    output('G92 E0')
    extruder_e_reset = extruder_e
    reset_e_on_next_prime = false
  end
  return e
end


function layer_start(zheight)
  comment('<layer ' .. layer_id .. '>')
  if layer_id == 0 then
    output('G0 F600 Z' .. ff(zheight))
  else
    output('G0 F100 Z' .. ff(zheight))
  end
  current_z = zheight
end

function layer_stop()
  reset_e_on_next_prime = true
  comment('</layer ' .. layer_id .. '>')
end

function select_extruder(extruder)
end

function swap_extruder(from,to,x,y,z)
end

function move_xyz(x,y,z)
  x = x - bed_origin_x
  y = y - bed_origin_y
  if z == current_z then
    output('G0 X' .. f(current_frate) .. ' X' .. f(x) .. ' Y' .. f(y))
  else
    output('G0 X' .. f(current_frate) .. ' X' .. f(x) .. ' Y' .. f(y) .. ' Z' .. f(z))
    current_z = z
  end
end

function move_xyze(x,y,z,e)
  letter = 'A'
  extruder_e = e
  x = x - bed_origin_x
  y = y - bed_origin_y
  if z == current_z then
    output('G1 X' .. f(current_frate) .. ' X' .. f(x) .. ' Y' .. f(y) .. ' ' .. letter .. ff(to_mm_cube(e - extruder_e_reset)) )
  else
    output('G1 X' .. f(current_frate) .. ' X' .. f(x) .. ' Y' .. f(y) .. ' Z' .. f(z) .. ' ' .. letter .. ff(to_mm_cube(e - extruder_e_reset)) )
    current_z = z
  end
end

function move_e(e)
  letter = 'E'
  extruder_e = e
  output('G1 ' .. letter .. ff(to_mm_cube(e - extruder_e_reset)))
end

function set_feedrate(feedrate)
  output('G1 F' .. feedrate)
  current_frate = feedrate
end

function extruder_start()
end

function extruder_stop()
end

function progress(percent)
  output('M73 P' .. percent)
end

function set_extruder_temperature(extruder,temperature)
  output('M104 S' .. f(temperature) .. ' T' .. extruder)
end

current_fan_speed = -1
function set_fan_speed(speed)
  if speed ~= current_fan_speed then
    output('M106 S'.. math.floor(255 * speed/100))
    current_fan_speed = speed
  end
end
