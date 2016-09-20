include <threads.scad>

//width of the narrow side
$start_width = 18.9;
//width of the wider side
$end_width = 12;

$diff_width = $start_width - $end_width;
//depth of the whole plate
$depth = 49;
// height of the base plate
$height = 1.8;
//width of the outer diagonal slide
$diag_width=1.4;

// height of the threading
$thread_h = 9;
// margin around the threading
$thread_margin = 4;
// position of thread in percent
$thread_pos = 0.5;
// thread diameter in inch
$thread_d = 0.26;
// thread hole diameter in mm
$thread_hole_d=9;

$thread_hole = false;

function zoll2mm(d=0.25) = d*25.4;
function mm2zoll(d=0.25) = d/25.4;

module diag($invert = false) {
    $rdw = $diag_width/2;
    translate([-$rdw,0.1,0]) {
        rotate([90,0,0]) {
            linear_extrude(height=0.1) {
                    if ($invert == false) {
                        polygon(points = [ [-$rdw, 0], [$rdw,0],[$rdw,$height],[-$rdw,0]], convexity = 10);
                    } else {
                        polygon(points = [ [$rdw, 0], [-$rdw,0],[-$rdw,$height],[$rdw,0]], convexity = 10);
                    }
            }
        }
    }
}

module base_plate($h=$height) {
    hull () {
        cube([$start_width,1,$h]);
        translate([$diff_width/2,$depth-1,0]) {
            cube([$end_width,1,$h]);
        }
    }
}

module push_plate() {
    base_plate();
    hull() {
        diag();
        translate([$diff_width/2,$depth-0.1,0]) {
            diag();
        }
    }
    hull() {
        translate([$start_width+$diag_width,0,0]) {
            diag(true);
        }
        translate([$diff_width/2+$end_width+$diag_width,$depth-0.1,0]) {
            diag(true);
        }
    }
}


module thread() {
    $cw = zoll2mm($thread_d)+$thread_margin;
        difference() {
            base_plate($thread_h);
            translate([$start_width/2-$cw/2,$depth*$thread_pos,$height]) {
                translate([$cw/2,$cw/2,-0.1]) {
                    if ($thread_hole == true) {
                        english_thread (diameter=$thread_d,length=mm2zoll($thread_h+0.2)); 
                    } else {
                            cylinder(d=$thread_hole_d,h=$thread_h);
                    }
                }
            }
        }
}

module tripod_mount() {
    push_plate();
    thread();
}


tripod_mount();