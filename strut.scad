include <BOSL2/std.scad>
include <variables.scad>

module strut_test() {
  test_height = 13;

  difference() {
    union() {
      cylinder(d = bearing_od - bearing_d_gap, h = test_height);

      zmove(test_height)
        cylinder(d = strut_bearing_insert_d, h = strut_bearing_insert_h);
    }

    xmove(-bearing_od / 2)
      ymove(strut_bearing_insert_d / 2 - strut_flatness)
        cube([bearing_od, bearing_od, test_height + strut_bearing_insert_h]);
  }
}