import("original_files/bottom_front_left_corner.stl");
difference() {
    union() {
        color("red") translate([3, 51.5, 2]) cube([0.5, 21, 19.5]);
        color("red") translate([5.5, 51.5, 2]) cube([0.5, 21, 19.5]);
    }
    
    color("green") translate([0, 72.5, 1]) rotate([45, 0, 0]) cube([10, 20, 29.577]); 
}


