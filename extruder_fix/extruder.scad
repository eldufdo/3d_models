
module extruder() {
    translate([28,-60,0]) {
        rotate([0,0,45]) {
            import("extruder.stl");
        }
    }
}


difference() {
    extruder();
    translate([-30,22.9,-11]) {
        cube([80,50,50]);
    }
}

difference() {
    translate([0,22.92,14]) {
        rotate([90,0,0]) {
            cylinder(r=5,h=6);
        }
    }

   translate([0,60,14]) {
        rotate([90,20,0]) {
            cylinder(r=2,h=50);
        }
    }
}

translate([-15,17.5,24]) {
    cube([31.6,22,4]);
}

translate([-15,34.5,28]) {
    cube([31.6,5,8]);
}
translate([-15,17.5,0]) {
    cube([31.6,22,4]);
}

translate([11.5,17.5,0]) {
    cube([5,22,25]);
}

translate([15,34.5,0]) {
    cube([10,5,28]);
}

/*translate([-15,17.5,0]) {
    cube([31.6,22,5]);
}

translate([-15,17.5,0]) {
    cube([5,22,28]);
}

/*
translate([0,0,2]) {
    union () {
        hull() {
            translate([-5,3.9,25]) {
                cube([3,1,5]);
            }
            translate([-5,34.9,25]) {
                cube([3,5,20]);
            }
        }

        hull() {
            translate([13.5,3.9,25]) {
                cube([3,1,5]);
            }
            translate([13.5,34.9,25]) {
                cube([3,5,20]);
            }
        }
        
        difference() {
            translate([-5,34.9,25]) {
                cube([20,5,20]);
            }
            translate([5,67,35]) {
                rotate([90,0,0]) {
                    cylinder(r=1.5,h=40);   
                }
            }
        }
    }
}*/

