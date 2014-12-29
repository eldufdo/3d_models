module scheppach_play_ring($h=3) {
	difference() {
		cylinder(r=6,h=$h);
		translate([0,0,-0.1]) {
			cylinder(r=4.5,h=$h+0.2);
		}
	}
}

scheppach_play_ring(1);