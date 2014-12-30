module wallHook() {
    translate([0,10,0]) {
        difference(){
            cube([10,40,30]);
            translate([-5, 20, 20]) {
                rotate([0,90,0]) {
                    cylinder(h=20,r=2);
                }
            }
        }

    }
    translate([5,-10,0]) {
        dxfHook();
    }
    for (i=[-20,70]) {
        translate([104.5, i, 0]) {
            cube(size=[10,10, 25], center=false);
        }
    }


}

module dxfHook() {
    linear_extrude(height=10,center = false, convexity = 10) {
       import (file = "prop_wall_hook.dxf");
    }
}





wallHook();


