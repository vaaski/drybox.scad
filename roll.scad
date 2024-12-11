include <BOSL2/std.scad>
include <variables.scad>

module roll_tube() {
  tube(od = roll_insert_d, h = roll_insert_h, wall = roll_insert_wall_thickness, $fn = 2 * $fn, anchor = BOTTOM);
}

roll_tube();