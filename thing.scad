include <BOSL2/std.scad>
include <variables.scad>

use <strut.scad>
use <mount.scad>

strut_total_width = box_width - 2 * mount_plate_thickness;

if ($preview) {
  strut(strut_total_width / 3);
  mirror_copy([0, 1, 0])
    ymove(strut_total_width / 3 * 1.5 + bearing_w)
      strut_end(strut_total_width / 3);

  mirror_copy([0, 1, 0])
    zmove(-mount_wall_thickness)
      ymove(strut_total_width / 3 * 1.5 + bearing_w + mount_plate_thickness)
        xrot(90)
          ymove(mount_plate_height / 2)
            mount();

  mirror_copy([0, 1, 0])
    ymove(strut_total_width / 3 / 2 + bearing_w * 1.5)
      xrot(90)
        bearing_shim();
} else {
  strut(strut_total_width / 3);

  mirror_copy([0, 1, 0])
    ymove(strut_total_width / 3 * 1.5 + bearing_w + 1)
      strut_end(strut_total_width / 3);

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
}