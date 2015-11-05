$fn = 100;

$idler_od=22;
$idler_id=18;
$idler_bored=16.3;
$idler_shell_depth=2;

$idler_center_depth=8;

$bearing_od=16.3;
$bearing_h=5;

module Bearing() {
    cylinder(d=$bearing_od,h=$bearing_h);
}

module IdlerBorder() {
    rotate_extrude(convexity = 10, $fn = 100)
        translate([$idler_od/2-$idler_shell_depth, 0])
            circle(r = 2, $fn = 3);
}

module Idler() {
    difference() {
        union () {
            //center block
            cylinder(d=$idler_id,h =$idler_center_depth+4*$idler_shell_depth);
            
            //outer shell bottom
            cylinder(d=$idler_od,h=$idler_shell_depth);
            
            //outer shell top
            translate([0,0,$idler_center_depth+3*$idler_shell_depth]) {
                cylinder(d=$idler_od,h=$idler_shell_depth);
            }
            
            // smoother top
            translate([0,0,$idler_center_depth+3*$idler_shell_depth]) {
                IdlerBorder();
            }
            
            // smoother bottom
            translate([0,0,$idler_shell_depth]) {
                IdlerBorder();
            }
        }
        union () {
            // bore
            translate([0,0,-0.1]) {
                $thickness = $idler_shell_depth*4 + $idler_center_depth+0.2;
                cylinder(d=$idler_bored,h=$thickness);
            }
            // bearing cutout
            $bh = 2*$idler_shell_depth + $idler_center_depth/2 - $bearing_h/2;
            translate([0,0,$bh]) {
                Bearing();
            }
        }
    }
}

Idler();