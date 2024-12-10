$fn = $preview ? 64 : 128;

tolerance_tight = 0.125;
tolerance_normal = 0.25;
OVERLAP = 0.001;

bearing_id = 8;
bearing_od = 22;
bearing_w = 7;
bearing_d_gap = 2;

bearing_spacer_d = 10;
bearing_spacer_h = 0.5;

strut_bearing_insert_h = bearing_w / 2;
strut_d = bearing_od - bearing_d_gap;
strut_center_offset = bearing_id / 4;

mount_wall_thickness = 1.5;
mount_wall_rounding = 1.5;
mount_wall_extrusion = 4;
mount_plate_width = strut_d + 2 * mount_wall_thickness + tolerance_normal;
mount_plate_height = strut_d / 2 + strut_center_offset + 2 * mount_wall_thickness + tolerance_normal;
mount_plate_nut_id = 6.85;
mount_plate_nut_height = 3.3;
mount_plate_screw_diameter = 4;
mount_plate_thickness = mount_plate_nut_height + 1.8;

box_width = 80;
box_wall_thickness = 2.2;