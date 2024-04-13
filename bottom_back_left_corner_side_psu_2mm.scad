mirror([1, 1, 0]) union() {
    import("original_files/bottom_back_left_corner.stl");

    difference() {
        union() {
            color("red") translate([3, 52, 2]) cube([0.5, 21, 19.5]);
            color("red") translate([5.5, 52, 2]) cube([0.5, 21, 19.5]);
        }
        
        color("green") translate([0, 73, 1]) rotate([45, 0, 0]) cube([10, 20, 29.577]); 
    }

    difference() {
        union() {
            color("red") translate([52, 3, 2]) cube([20, 0.5, 19.5]);
            color("red") translate([52, 5.5, 2]) cube([20, 0.5, 19.5]);
        }
        
        color("green") translate([52, 0, 22]) rotate([0, 45, 0]) cube([39.577, 20, 29.577]); 
    }
}