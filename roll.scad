include <BOSL2/std.scad>
include <variables.scad>

module roll_tube(od = roll_insert_d, h = roll_insert_h, id = bearing_od) {
  tube(od = od, h = h, id = id, $fn = 2 * $fn, anchor = BOTTOM);
}

roll_tube();