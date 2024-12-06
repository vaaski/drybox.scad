include <BOSL2/std.scad>
include <variables.scad>

module strut_test() {
  test_height = 13;

  back_half()
    ymove(bearing_id / 4)
      union() {
        cylinder(d = strut_d, h = test_height);

        zmove(test_height)
          cylinder(d = bearing_spacer_d, h = bearing_spacer_h);

        zmove(test_height + bearing_spacer_h)
          cylinder(d = bearing_id, h = strut_bearing_insert_h);

      }
}

xrot(90)
  strut_test();