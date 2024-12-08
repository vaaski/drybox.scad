include <BOSL2/std.scad>
include <variables.scad>


module strut_test(length = 13) {
  back_half()
    ymove(strut_center_offset)
      union() {
        cylinder(d = strut_d, h = length, $fn = 2 * $fn);

        zmove(length)
          cylinder(d = bearing_spacer_d, h = bearing_spacer_h);

        zmove(length + bearing_spacer_h)
          cylinder(d = bearing_id, h = strut_bearing_insert_h);

      }
}

module bearing_tightener() {
  ymove(-tolerance_tight)
    front_half()
      ymove(strut_center_offset + tolerance_tight)
        cylinder(d = bearing_id, h = bearing_w);
}

// -----------------------------------------------------------------------------

xrot(90) {
  strut_test(12);

  zmove(12 + bearing_spacer_h)
    bearing_tightener();
}