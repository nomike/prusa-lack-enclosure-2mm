import("original_files/bottom_front_right_corner.stl");
difference() {
    union() {
        color("red") translate([44, 51.5, 2]) cube([0.5, 21, 19.5]);
        color("red") translate([46.5, 51.5, 2]) cube([0.5, 21, 19.5]);
    }
    
    color("green") translate([42, 72.5, 1]) rotate([45, 0, 0]) cube([10, 20, 29.577]); 
}


