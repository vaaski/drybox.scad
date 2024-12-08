include <BOSL2/std.scad>
include <variables.scad>

use <strut.scad>

zmove(mount_plate_thickness)
  ymove(-strut_d / 4)
    ymove(-strut_center_offset / 2)
      #strut_test();

module mount_baseplate2d() {
  rect([mount_plate_width, mount_plate_height], rounding = mount_wall_rounding);
}

module mount_baseplate_walls2d() {
  difference() {
    mount_baseplate2d();

    ymove((-strut_d / 2 - strut_center_offset) / 2 - tolerance_normal)
      rect(strut_d + 2 * tolerance_normal, anchor = BOTTOM);
  }
}

module mount_base3d() {
  linear_extrude(mount_plate_thickness)
    mount_baseplate2d();

  zmove(mount_plate_thickness)
    linear_extrude(mount_wall_extrusion)
      mount_baseplate_walls2d();
}

module mount() {
  mount_base3d();
}

mount();