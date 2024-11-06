include <BOSL2/std.scad>
include <variables.scad>

module strut_test() {
  test_height = 13;

  difference() {
    union() {
      cylinder(d = strut_d, h = test_height);

      zmove(test_height)
        #cylinder(d = bearing_id, h = strut_bearing_insert_h);
    }

    xmove(-bearing_od / 2)
      ymove(bearing_id / 2 - strut_flatness)
        cube([bearing_od, bearing_od, test_height + strut_bearing_insert_h]);
  }
}

xrot(-90)
  strut_test();