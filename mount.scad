include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <variables.scad>

use <strut.scad>

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

  zmove(mount_plate_thickness - OVERLAP)
    linear_extrude(mount_wall_extrusion)
      mount_baseplate_walls2d();
}

module screwhole() {
  union() {
    zmove(mount_plate_thickness - mount_plate_nut_height + OVERLAP)
      linear_extrude(mount_plate_nut_height)
        zrot(30)
          hexagon(id = mount_plate_nut_id);

    zmove(-OVERLAP)
      cyl(d = mount_plate_screw_diameter, h = mount_plate_thickness, anchor = BOTTOM);
  }
}

module mount() {
  difference() {
    mount_base3d();

    mirror_copy([1, 0, 0])
      xmove((mount_plate_width - mount_wall_thickness * 2) / 4)
        screwhole();
  }
}

mount();

%zmove(mount_plate_thickness)
  ymove(-strut_d / 4)
    ymove(-strut_center_offset / 2)
      xrot(-90)
        strut_end();