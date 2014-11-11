difference(){
	cube([40,40,80], center=true); 
rotate([90,0,0]){
cube([75,4,30],center=true);
}
union () {
translate([0,0,10]){
cylinder(60,4.5,4.5);
}
	translate([0,0,-50]){
		cylinder(40,4.5,4.5);
}
translate([0,0,-40]){
cylinder(80,2,2);
}
}
}