
//size of the switch
switch_x = 3.9;
switch_y = 8.65;
switch_z = 3.7;


//pin spacing on board
hole_x  = 2.54; //change this one
hole_y  = 2.54;


th = 0.5;

height = 2;

angle = atan((switch_x - hole_x)/height);
/*
        (switch_x - hole_x)
         _______
     h   |     /
     e   |    /
     i   |   /
     g   |  /
     h   | /
     t   |/
*/



$fn=20;

module switch(){
    //switch body
    cube([switch_x + 0.01, switch_y, switch_z]);
    //slide switch itself
    translate([(switch_x-1.5)/2, (switch_y-3.55)/2, switch_z]) cube([1.5, 3.55, 1.9]);

    //pins
    // translate([switch_x/2, switch_y/2, -4.6]) cylinder(h=5, d=0.5);
    // translate([switch_x/2, switch_y/2 + 2.54, -4.6]) cylinder(h=5, d=0.5);
    // translate([switch_x/2, switch_y/2 - 2.54, -4.6]) cylinder(h=5, d=0.5);
}

module pins(){
    translate([0, 0, -1]) cylinder(h=5, d=0.5);
    translate([0, hole_y, -1]) cylinder(h=5, d=0.5);

    //switch 3rd pin
    translate([0, 2.54 + 2.54, -1]) cylinder(h=5, d=0.5);

    hull() {
        translate([hole_x, 0, 0]) cylinder(h=5, d=0.5);
        translate([hole_x, 0, -0.1]) rotate([0, angle, 0]) cylinder(h=5, d=0.5);
    }
    hull() {
        translate([hole_x, hole_y, 0]) cylinder(h=5, d=0.5);
        translate([hole_x, hole_y, -0.1]) rotate([0, angle, 0]) cylinder(h=5, d=0.5);
    }

    //switch 3rd pin
    hull() {
        translate([hole_x, 2.54 + 2.54, -1]) cylinder(h=5, d=0.5);
        translate([switch_x, 2.54 + 2.54, -1]) cylinder(h=5, d=0.5);
    }
}




difference() {
    translate([-th, -th, 0]) cube([switch_x*2 + 2*th, switch_y + 2*th, height + th]);

    translate([0, 0, height]) switch();
    translate([switch_x, 0, height]) switch();



    //cutout for 3rd pin to bend into
    translate([switch_x/2, switch_y/2 + 2.54, 0]) hull() {
        translate([0, 0, 0.4]) rotate([270, 0, 0]) cylinder(h=20, d=0.5);
        translate([0, 0, -1]) rotate([270, 0, 0]) cylinder(h=20, d=0.5);
    }

    //cutout for 3rd pin to bend into
    translate([3*switch_x/2, switch_y/2 + 2.54, 0]) hull() {
        translate([0, 0, 0.4]) rotate([270, 0, 0]) cylinder(h=20, d=0.5);
        translate([0, 0, -1]) rotate([270, 0, 0]) cylinder(h=20, d=0.5);
    }



    translate([switch_x/2, switch_y/2 - 2.54, 0]) pins();
}
