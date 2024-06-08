handle_pertrusion = 20;
base_thickness = 3;

handle_angle = 120;
handle_length = 20;
handle_thickness = base_thickness;

handle_z_offset = handle_thickness * sin(90 - (180 - handle_angle));

glass_pane_thickness = 2;
glass_pane_holder_thickness = 2;
magnet_thickness = 3;
magnet_width = 20;
magnet_heigth = 10;
magnet_cover = 1;
magnet_pushout_hole_radius = 1;
glass_pane_holder_heigth = magnet_heigth + 2  * magnet_cover;


cutoff_angle = 60;
cutoff_hypertenuse = (glass_pane_holder_heigth + base_thickness) * sin(cutoff_angle);
cutoff_extend = cutoff_hypertenuse * sin(30);
base_width = magnet_cover + magnet_width + magnet_cover + cutoff_extend;


magnet_hole_x_offset = magnet_cover;

glass_pane_holder_total_thickness = glass_pane_thickness + glass_pane_holder_thickness * 2 + magnet_thickness + magnet_cover;
base_depth = glass_pane_holder_total_thickness + handle_pertrusion; 
magnet_hole_width = magnet_width + cutoff_extend;

handle_overhang = handle_length * sin(90 - (180 - handle_angle));
handle_angle_addition = handle_thickness;

mirror_x = 1;

mirror([mirror_x, 0, 0]) difference() {
    // glass-pane-holder
    union() {
        // top
        cube([base_width, base_depth, base_thickness]);
        // handle
        color("Red") translate([0, sqrt(handle_thickness^2 - handle_z_offset^2), handle_z_offset]) rotate([handle_angle, 0, 0]) cube([base_width, handle_length, handle_thickness]);
        // holder
        translate([0, base_depth - glass_pane_holder_total_thickness, 0]) cube([base_width, glass_pane_holder_total_thickness, glass_pane_holder_heigth]);
    }
    // glass-pane-slit
    translate([0, base_depth - glass_pane_holder_total_thickness + glass_pane_holder_thickness, base_thickness]) cube([base_width, glass_pane_thickness, glass_pane_holder_heigth - base_thickness]);
    // magnet hole
    translate([magnet_hole_x_offset, base_depth - magnet_thickness - magnet_cover, (glass_pane_holder_heigth - magnet_heigth) / 2]) cube([magnet_hole_width, magnet_thickness, magnet_heigth]);
    // magnet removal hole
    translate([0, base_depth - magnet_cover - (magnet_thickness / 2), glass_pane_holder_heigth / 2]) rotate([0, 90, 0])  cylinder(h=base_width, r=magnet_pushout_hole_radius, $fn=32);
    translate([0, 0 - handle_overhang, 0]) rotate([0, 0 - cutoff_angle, 0]) color("Cyan") cube([handle_length + handle_angle_addition, handle_overhang + base_depth, 10]);
}
