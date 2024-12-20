include <BOSL2/std.scad>
include <variables.scad>

use <strut.scad>
use <mount.scad>
use <roll.scad>

/* [main] */
force_view = "print";// [no, assembled, print]

/* [filament roll insert settings] */
render_roll_insert = true;
roll_insert_d = 54;
roll_insert_h = 65;
roll_insert_wall_thickness = 2;

strut_total_width = box_width - 2 * mount_plate_thickness - 2 * bearing_w;
strut_third_width = strut_total_width / 3;

if ((force_view == "no" && $preview) || force_view == "assembled") {
  strut(strut_third_width);

  mirror_copy([0, 1, 0])
    ymove(strut_third_width * 1.5 + bearing_w)
      strut_end(strut_third_width);

  mirror_copy([0, 1, 0])
    zmove(-mount_wall_thickness)
      ymove(strut_third_width * 1.5 + bearing_w + mount_plate_thickness)
        xrot(90)
          ymove(mount_plate_height / 2)
            mount();

  mirror_copy([0, 1, 0])
    ymove(strut_third_width / 2 + bearing_w * 1.5)
      xrot(90)
        bearing_shim();

  if (render_roll_insert) {
    xrot(90)
      zmove(-roll_insert_h / 2)
        #roll_tube(od = roll_insert_d - 2 * tolerance_tight, h = roll_insert_h, id = bearing_od);
  }
} else {
  strut(strut_third_width);

  mirror_copy([0, 1, 0])
    ymove(strut_third_width * 1.5 + bearing_w + 1)
      strut_end(strut_third_width);

  xmove(-bearing_od - 1)
    mirror_copy([0, 1, 0])
      ymove(mount_plate_height)
        mount();

  zmove(-tolerance_tight)
    xmove(bearing_od + 1)
      mirror_copy([0, 1, 0])
        ymove(1)
          xrot(-90)
            bearing_shim();

  if (render_roll_insert) {
    xmove(roll_insert_d / 2)
      xmove(bearing_od * 2)
        roll_tube(od = roll_insert_d - 2 * tolerance_tight, h = roll_insert_h, id = bearing_od);
  }
}