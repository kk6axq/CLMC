/*
Two Piece Motor Mount
Lukas Severinghaus
October 22, 2020
Generates a motor mount to hold the sensor PCB. 
Sized to fit a Pololu 37mm diameter gear motor.
*/

//Set to 1 to view entire assembly
//Set to 2 to view only the base
//Set to 3 to view only the top
view = 1;


hole_size=3.5;
base_hole_spacing = 31;
cr = 100;

post_s = 2;
post_h = 30;

base_h = 3;

top_spacing = 17;

module base(){
difference(){
    union(){
        //Tower
        translate([0, 10, 0]) cylinder(post_h, r1=hole_size/2+2, r2=hole_size/2+2, $fn=cr);
        //Holes

        //Base pieces
        translate([0, 8, 0]) rotate([0, 0, -35]) cube([15, base_h+2, base_h]);
        translate([0, 8, 0]) rotate([0, 0, 180+35]) translate([0, -base_h-2, 0]) cube([15, base_h+2, base_h]);
        translate([-1 * (base_hole_spacing / 2), 0, 0]) cylinder(base_h, r1=hole_size/2+2, r2=hole_size/2+2, $fn=cr);

        translate([(base_hole_spacing / 2), 0, 0]) cylinder(base_h, r1=hole_size/2+2, r2=hole_size/2+2, $fn=cr);
            }

        translate([-1 * (base_hole_spacing / 2), 0, -0.1]) cylinder(5, r1=hole_size/2, r2=hole_size/2, $fn=cr);

        translate([(base_hole_spacing / 2), 0, -0.1]) cylinder(5, r1=hole_size/2, r2=hole_size/2, $fn=cr);
        translate([0, 10, base_h]) cylinder(30, r1=2.7, r2=2.7, $fn=cr);
    }
}
//base();
module upper(){
    difference(){
    union(){
    translate([top_spacing / 2 * -1, 0, 0]) cylinder(base_h, r1=hole_size/2+2, r2=hole_size/2+2, $fn=cr);
    translate([top_spacing / 2, 0, 0]) cylinder(base_h, r1=hole_size/2+2, r2=hole_size/2+2, $fn=cr);
    translate([-9, 0, 0]) cube([18, 3.7, base_h]);
    translate([-1 * (hole_size/2+2), 0, 0]) cube([hole_size+4, 20, base_h]);
    translate([0, 20, 0]) cylinder(base_h, r1=hole_size/2+2, r2=hole_size/2+2, $fn=cr);
    }
    translate([top_spacing / 2 * -1, 0, -0.1]) cylinder(base_h+2, r1=hole_size/2, r2=hole_size/2, $fn=cr);
    translate([top_spacing / 2, 0, -0.1]) cylinder(base_h+2, r1=hole_size/2, r2=hole_size/2, $fn=cr);
    translate([0, 20, -0.1]) cylinder(base_h+0.2, r1=hole_size/2, r2=hole_size/2, $fn=cr);
    translate([0, 5, -0.1]) cylinder(base_h+0.2, r1=hole_size/2, r2=hole_size/2, $fn=cr);
    translate([-1 * (hole_size / 2), 5, -0.1]) cube([hole_size, 15, base_h + 0.2]);
}
}
if(view==1){
    base();
    translate([0, -10, 30]) upper();
}else if(view == 2){
    base();
}else if(view == 3){
    upper();
}    