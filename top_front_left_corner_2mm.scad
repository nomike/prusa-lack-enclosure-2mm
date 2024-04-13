import("original_files/top_front_left_corner.stl");
difference() {
    union() {
        color("red") translate([52, 3, 2]) cube([20, 0.5, 20]);
        color("red") translate([52, 5.5, 2]) cube([20, 0.5, 20]);
    }
    
    color("green") translate([52, 0, 22]) rotate([0, 45, 0]) cube([39.577, 20, 29.577]); 
}


