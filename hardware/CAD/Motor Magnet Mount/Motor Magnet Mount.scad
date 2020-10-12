/*
Parametric Magnet Holder
Lukas Severinghaus
September 12, 2020
This program generates a 3d model to hold a magnet of a certain size
on top of a keyed axle. All the dimensions can be changed in the 
variables below.
This program is measurement unit independent.
*/

//Height of the motor axle
axle_height = 6;
//Radius of the motor axle
axle_radius = 3.35; //3.1 was too small
//Distance from the center of the axle to where the key starts
key_offset = 2.4;


//Height of the layer between the motor axle and magnet
separator_height = 2;

//Magnet dimensions
magnet_height = 2.5;
magnet_radius = 3.5; //3.2 was too small

//Wall thickness of the piece
wall_thickness = 2;

//Advanced config parameters
//How many lines to break the circle into
circle_resolution = 80;

//How much extra to cut through the faces, smaller is better
cut_offset = 0.1;

//Radius of the outer containing cylinder.
outer_radius = max(magnet_radius, axle_radius) + wall_thickness;

total_height = axle_height + separator_height + magnet_height;
//Cut the magnet hole
difference(){
    //Cut the axle keyed hole out of the bottom of the piece
    difference() {
        //Define the base cylinder
        cylinder(total_height, outer_radius, outer_radius, $fn=circle_resolution);
        //Move the cylinder down a little to fully cut through the face
        translate([0, 0, -1 * cut_offset]){
            //Cut the key in the shaft
            difference() {
                //Define the shaft cylinder
                cylinder(axle_height + cut_offset, axle_radius, axle_radius, $fn=40);
                //Translate and define the key rectangle
                translate([key_offset, -1 * axle_radius, 0]) {
                    cube([axle_radius - key_offset + cut_offset, axle_radius * 2, axle_height + cut_offset]);
                }
            }
        }
    }

    translate([0, 0, axle_height + separator_height]) {
        cylinder(magnet_height + cut_offset, magnet_radius, magnet_radius, $fn=circle_resolution);
    }
    
    translate([4.5, -10, -1 * cut_offset]) cube([1,25, 20]);
}