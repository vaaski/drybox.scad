include <BOSL2/std.scad>
include <variables.scad>


module strut_end(length = 13) {
  strut_len = length - bearing_spacer_h;

  xrot(90)
    back_half()
      ymove(strut_center_offset)
        union() {
          cylinder(d = strut_d, h = strut_len, $fn = 2 * $fn);

          zmove(strut_len)
            cylinder(d = bearing_spacer_d, h = bearing_spacer_h);

          zmove(strut_len + bearing_spacer_h)
            cylinder(d = bearing_id, h = strut_bearing_insert_h);

        }
}

module strut(length = 20) {
  union()
    mirror_copy([0, 1, 0])
      strut_end(length / 2);

}

module bearing_shim() {
  ymove(-tolerance_tight)
    front_half()
      ymove(strut_center_offset + tolerance_tight)
        cylinder(d = bearing_id, h = bearing_w * 2);
}

// -----------------------------------------------------------------------------

strut(10);
// strut_end(10);

// xrot(90) {
//   strut_end(12);

//   ymove(-tolerance_tight)
//     zmove(12 + bearing_spacer_h)
//       // zmove(bearing_id / 2)
//       // zrot(180)
//       bearing_shim();
// }