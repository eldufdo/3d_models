/*
 * Nail for sun reflection discs 
 * the nail holds the plexiglas circle in place
 * of the 6x4 mm cfk pipe
*/

$od=6; // outer diameter of cfk pipe
$id=3.7; // inner diameter of cfk pipe

$nailHeadHeight=2;
$nailHeadOD=4;
$fn=50;

$nailShaftWidth=14;
$nailEndWidth=3;

module cfkPipe($height) {
    difference() {
        cylinder(d=$od,h=$height);
        translate([0,0,0.1]) {
            cylinder(d=$id,h=$height+0.2);
        }
    }
}


module nailHead() {
    hull (){
        translate([0,0,$nailHeadHeight/2]) {
            cylinder(d=$nailHeadOD,h=$nailHeadHeight/2);
        }
        cylinder(d=$od+2,h=$nailHeadHeight/2);
    }
}

module nail() {
    rotate([0,180,0]) {
        nailHead();
    }
    hull() {
        cylinder(d=$id,h=0.1);
        translate([0,0,$nailShaftWidth-0.1]) {
            cylinder(d=$id,h=0.1);
        }
        translate([0,0,$nailShaftWidth+$nailEndWidth-0.1]) {
            cylinder(d=1,h=0.1);
        }
    }
}




//cfkPipe(10);
nail();
