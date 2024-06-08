include<openscad-screw-holes/screw_holes.scad>;

base_thickness = 3;
base_extend = 12;
base_depth = 14;
fillet_radius = 5;

center_gap = 6;
magnet_thickness = 3;
magnet_width = 20;
magnet_height = 10;
magnet_cover = 1;

front_thickness = magnet_thickness + (2 * magnet_cover);
front_width = center_gap / 2 + magnet_width + magnet_cover;
front_height = magnet_height + (2 * magnet_cover);

cutoff_angle = 60;
cutoff_hypotenuse = (front_height - base_thickness) / sin(cutoff_angle);
cutoff_offset = sqrt(pow(cutoff_hypotenuse, 2) - pow((front_height - base_thickness), 2));
magnet_pushout_hole_radius = 1;

module door_stop_half() {
    union() {
        difference() {
            union() {
                // base
                difference() {
                    difference() {
                        hull() {
                            cube([1, base_depth, base_thickness]);
                            translate([front_width + cutoff_offset + base_extend - base_depth / 2, base_depth / 2, 0]) cylinder(d=base_depth, h=base_thickness, $fn=64);
                        }
                        translate([front_width + cutoff_offset + base_extend - base_depth / 2, base_depth / 2, base_thickness]) rotate([180, 0, 0]) screw_hole(ISO14581, M3_5, base_thickness);
                    }
                }
                // front
                cube([front_width, front_thickness, front_height]);
                // fillet
                difference() {
                    translate([0, front_thickness, base_thickness]) cube([front_width + cutoff_offset, fillet_radius, fillet_radius]);
                    translate([0, front_thickness + fillet_radius, base_thickness + fillet_radius]) rotate([0, 90, 0]) cylinder(r=fillet_radius, h=front_width + cutoff_offset, $fn=64);
                }
                translate([front_width, 0, base_thickness]) cube([cutoff_offset, front_thickness, front_height - base_thickness]);
            }
            // cutoff
            translate([front_width + cutoff_offset, 0, base_thickness]) rotate([0, 0 - 90 + cutoff_angle, 0]) cube([((cutoff_offset * (front_height - base_thickness)) / cutoff_hypotenuse) , front_thickness + fillet_radius, cutoff_hypotenuse]);
            // magnet hole
            translate([center_gap / 2, magnet_cover, magnet_cover]) cube([magnet_width, magnet_thickness, magnet_height + magnet_cover]);
            // Magnet pushout hole
            translate([center_gap / 2 + magnet_width / 2, magnet_cover + magnet_thickness / 2, 0]) cylinder(r=magnet_pushout_hole_radius, h=magnet_cover, $fn=64);

        }
    }
}

door_stop_half();
mirror([1, 0, 0]) door_stop_half();
