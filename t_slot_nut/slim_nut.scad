difference() {
	union() {
		translate([-4.5,-3,0]) {
			cube([9,6,1]);
		}
		translate([-2.95,-3,0]) {
			cube([5.9,6,2]);
		}
	}
	cylinder(r=1.2,h=2,$fn=100);
}
