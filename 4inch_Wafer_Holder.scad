// Pankaj Deshmukh - Michigan Technological University - EE 5777
// 4" inch diameter circular/4" side square wafer silicon wafer holder for clean room 
// wafer cleaning

// Number of slides
slides = 2;

// Wafer thickness in mm
thickness = .5;

// 1 inch = 25.4 mm
inch = 25.4;

// size in inch
size = 4;
  
//Wafer diameter in mm
diameter = size*inch;

// Height for the holder
height = 65;

difference(){
   union(){
   translate([0, 0, (diameter/4)+4.5]) 
   rotate([90, 0, 0])
   cylinder(r = (diameter+11)/2,slides*(thickness+1.5)+15, center = true);
   
   translate([0,0,-25])
   cube([10,(slides*(thickness+1.5)+15),10],center = true);
   }  
   
   // cube for reducing the height
   translate([0, 0, (diameter/4)+35]) 
   cube([(diameter+15),slides*(thickness+1.5)+15,(diameter+30)/2], center = true);


   //Cylindrical cut
	translate([0, 0, (diameter/4)+2]) 
   {
	rotate([90, 0, 0]) {
	cylinder(r = (diameter/2)-1, h = slides*(thickness+1.5)+16, center = true, $fn = 100);
		}
	}
   
   // cuts for the circular wafers
   for(i=[0:1:slides])
	{
		translate([0,(i*(thickness+1.5))-slides,(diameter/4)+2])//(diameter/4)+2
       rotate([90, 0, 0])
       cylinder(r = (diameter/2)+2, h = thickness*2,center = true, $fn = 100);
	}

   // cuts for the square wafers
   for(i=[0:1:slides])
   {
   	translate([0,(i*(thickness+1.5))-slides,(diameter/4)])//(diameter/4)+2
     rotate([90, 0, 0])
     cube([diameter, diameter,thickness*2], center = true);
	}
}


difference(){
   // cube for handle
   union(){
   translate([(diameter/2)+6.5, 0, (3*diameter/4)-40])
   cube([6,slides*(thickness+1.5)+15,diameter+30], center = true);
   }
   
   // cube cut for handle
   translate([(diameter/2)+7.5, 0, (3*diameter/4)-40])
   cube([8,slides*(thickness+1.5),(diameter)+20], center = true);
}