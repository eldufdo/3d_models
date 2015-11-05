/*
 * Distance holder for the bearings in my bowden extruder
 */

//thickness
$t=1;
$curved=true;

module polyhole( d, h ) {
    n = max( round( 2 * d ), 3 );
    rotate( [0, 0, 180] ) cylinder( h = h, r = ( d / 2 ) / cos( 180 / n ), $fn = n );
}

module ring($od,$id,$h) {
    difference() {
        cylinder(d=$od,h=$h);
        translate([0,0,- 0.1]) {
            polyhole($id,$h + 0.2);
        }
    }
}

module distance_holder($od0,$od1,$id0,$thick=$t) {
    if ($curved) {
        difference() {
            hull () {
                translate([0,0,$thick]) 
                    ring($od1,$id0,$thick);
                translate([0,0,$thick-0.1]) {
                    ring($od1+2,$id0,0.1);
                }
            }
            translate([0,0,-0.1]) 
                polyhole(h=2*$thick+0.2, d=$id0);
        }
    } else {
        translate([0,0,$thick]) 
            ring($od1,$id0,$thick);
   }
    ring($od0,$id0,$thick);
}

//distance_holder(22,17.5,14,1); 

distance_holder(22,10.5,9,1); 
