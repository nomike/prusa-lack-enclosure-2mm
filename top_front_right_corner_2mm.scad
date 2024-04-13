import("original_files/top_front_right_corner.stl");
difference() {
    union() {
        color("red") translate([3, 52, 2]) cube([0.5, 20, 20]);
        color("red") translate([5.5, 52, 2]) cube([0.5, 20, 20]);
    }
    
    color("green") translate([0, 72, 2]) rotate([45, 0, 0]) cube([10, 20, 29.577]); 
}


