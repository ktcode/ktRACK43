//
// ktRACK43
//
 
gap1 = 0.001;
gap2 = 0.002;
th = 2;

SBW = 40;
SBD = 20;
SBH = 28;

//bot
BTW = 43;
BTD = 37;
BTH = 24;

//atom
ATW = 24+1;
ATD = 24+1;
ATH = 9.5+0.5;

translate([(10)+10, (12)+SBD/2, 57.5+1]) rotate([0, 0, -180]) arm();

//arm();
base();

futa();


module futa()
{
difference()
{
    union()
    {
        translate([(10)+10, (12)+SBD/2, 35]) cylinder(r1=80/2, r2=52.5/2, h=13.5, $fn=1000);
        
        //case
        translate([-40-25, 0, 35]) cube([40+25, 30, 3+th]);
    }
    translate([-70-20-1, 14, 0]) cube([43, 30, BTW+th*2]);
    translate([10, 12, 35-SBH+gap1]) SB();
    
    //kado
    translate([-100, -100, -gap1]) cube([200, 100, 100]);
    
    //bolt
    translate([10+10, 12+SBD-gap1, 35+13.5]) bolt();
    translate([10+10, 12+gap1, 35+13.5]) rotate([0, 0, 180]) bolt();
    translate([-40+gap1, 12+SBD/2-gap1, 35+5]) rotate([0, 0, 90]) bolt();
}
}


module base()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([60-7, 44, 35]);
        translate([(10)+10, (12)+SBD/2, 0]) cylinder(r=80/2, h=35, $fn=1000);
        
        //case
        translate([-40-20, 0, 0]) cube([30+20, 30, 35]);
        //#translate([-70-20, 0, 0]) cube([43, 30, BTW+th*2]);
        translate([-70-20+1, 0, 0])
        rotate([-90, -90, 0])
        translate([12/2, 12/2, 0])
        minkowski()
        {
            cube([35, 30-1, 43-12-2]);
            cylinder(r=12/2, h=1, $fn=100);
        }
    }
    translate([10, 12, 35-SBH+gap1]) SB();
    
    //kado
    //translate([-100, -100+25.5, -gap1]) cube([100, 100, 100]);
    translate([-100, -100, -gap1]) cube([200, 100, 100]);
    
    //neji
    translate([10, 44-6, 0]) mokuneji();
    translate([30, 44-6, 0]) mokuneji();
    translate([50, 44-6, 0]) mokuneji();
    translate([10, 6, 0]) mokuneji();
    translate([30, 6, 0]) mokuneji();
    translate([50, 6, 0]) mokuneji();
    
    //case
    translate([-40-20, ATH+th, BTW+th-BTW/2+ATW/2]) rotate([90, 90, 0]) atom();
    translate([-30-20, 17, BTW+th]) rotate([90, 90, 180]) bot();
    translate([-70-5-20, -gap1, -gap1]) cube([30, 12+gap2, BTW+th*2+gap2]);
    translate([-33, th, th]) cube([33, 30-th*2, 35-th+gap1]);
    translate([-33-9+th, th+ATH+th, th]) cube([33, 30-th*2-ATH-th, 35-th+gap1]);
    translate([-70-5+30-20-gap1, 0-gap1, 35+gap1]) cube([50, 14, BTW+th*2-35]);
    
    //nat
    translate([10+10, 12+SBD-gap1, 35]) nat();
    translate([10+10, 12+gap1, 35]) rotate([0, 0, 180]) nat();
    translate([-40+gap1, 12+SBD/2-gap1, 35]) rotate([0, 0, 90]) nat();
    
    //wire
    translate([-100, -gap1, -gap1]) cube([100, 4, 4]);
    translate([0, 10, -gap1]) cube([55, 4, 4]);
    translate([55-3, 10+1.2, -gap1]) rotate([0, 0, -45]) cube([55, 4, 4]);
    translate([-10, -gap1, -gap1]) cube([10, 14, 4]);


    //kesu
    //translate([th, -20, -gap1]) cube([200, 100, 100]);
    //translate([-50, 30, -gap1]) cube([200, 100, 100]);
}
translate([-30-20, th+0.5, BTW+th-BTW/2]) rotate([90, 90, 0]) cylinder(r2=4/2, r1=2/2, h=0.5, $fn=100);
}

module arm()
{
translate([-5-(40/2), -10/2, 0])
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([200, 10, 5]);
        //translate([70, 0, 0]) rotate([0, 0, 23]) cube([160, 10, 5]);
        translate([-10, 12, 5]) rotate([180, 0, 15.5]) cube([240, 10, 5]);
        translate([200, 0, 0]) rotate([0, 0, 70]) cube([80, 10, 5]);
        translate([200, 0, 0]) rotate([0, 0, 115]) cube([61, 10, 5]);
        translate([220, 70, 0]) cylinder(r=20/2, h=5, $fn=100);
        
        //guide
        translate([0, -2, 5-12]) cube([70, 2, 12]);
        translate([0, 10, 5-12]) cube([70, 2, 12]);
        translate([-30, -2, 5-12]) cube([30, 14, 12]);
        translate([-30+13, -2, 5-12-15]) rotate([0, -45, 0]) cube([25, 14, 12]);
        translate([-30, -2, 5-60]) cube([13, 14, 60]);
        translate([-30+8.5, -2+(14/2), -55+1+25]) cylinder(r1=13/2, r2=9/2, h=5, $fn=100);
        translate([-30+8.5, -2+(14/2), -55+25]) cylinder(r=13/2, h=1, $fn=100);
        translate([-30+8.5, -2+(14/2), -55+1]) cylinder(r1=13/2, r2=9/2, h=5, $fn=100);
        translate([-30+8.5, -2+(14/2), -55]) cylinder(r=13/2, h=1, $fn=100);
        
        translate([5+40+5, -2, 5-12]) cube([20, 10+4, 12]);
        translate([5+40+5+20, -2, 5-12]) cube([130, 10+4, 12]);
        translate([5+40+5+20+60, -2, 5-50]) cube([70, 10+4, 50]);
        translate([200, 0, 5-50]) rotate([0, 0, 70]) cube([80, 10, 50]);
        
        
        
    }
    translate([0, 0, -15]) cube([10, 10, 15]);
    translate([0, -10-2, 5-60+gap1]) cube([200, 10, 60]);
    translate([93+3.5, -2-gap1, -57.5+3.5])
    rotate([-90, -90, 0])
    translate([12/2, 12/2, 0])
    minkowski()
    {
        cube([35, 30, 43-12-2]);
        cylinder(r=12/2, h=1, $fn=100);
    }
    translate([160, -26, 5-50-gap1]) rotate([0, 0, 23]) cube([80, 10, 50+gap2]);
    translate([-30+13-15, -2-gap1, 5-12-15+5]) rotate([0, -45, 0]) cube([40, 14+gap2, 15]);
    
    //neji
    translate([5, 10/2, -gap1]) cylinder(r=3.5/2, h=10+gap2, $fn=100);
    translate([5+40, 10/2, -gap1]) cylinder(r=3.5/2, h=10+gap2, $fn=100);
    
    //SB2
    //#translate([140, 17, -SBH+5]) SB();
}
}
module arm_s()
{
translate([-5-(40/2), -10/2, 0])
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([200, 10, 5]);
        translate([70, 0, 0]) rotate([0, 0, 23]) cube([160, 10, 5]);
        translate([200, 0, 0]) rotate([0, 0, 70]) cube([80, 10, 5]);
        translate([200, 0, 0]) rotate([0, 0, 115]) cube([60, 10, 5]);
        translate([220, 70, 0]) cylinder(r=20/2, h=5, $fn=100);
    }
    translate([0, -10-2, 5-60+gap1]) cube([200, 10, 60]);
    
    //neji
    translate([5, 10/2, -gap1]) cylinder(r=3.5/2, h=10+gap2, $fn=100);
    translate([5+40, 10/2, -gap1]) cylinder(r=3.5/2, h=10+gap2, $fn=100);
}
}

module SB()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([SBW, SBD, SBH+15]);
        translate([-6, 0, SBH-gap1]) cube([SBW+12, SBD, 6+10]);
        translate([-13, SBD/2-7/2, 0]) cube([SBW, 7, SBH]);
        //translate([-7, SBD/2-7/2, 10]) cube([SBW, 7, 10]);
        
        //jiku
        translate([10, SBD/2, SBH+15]) cylinder(r=10/2, h=8.5, $fn=100);
        
        //neji
        translate([-4.75, SBD/2-5, SBH-15]) cylinder(r=2.5/2, h=15, $fn=100);
        translate([-4.75, SBD/2+5, SBH-15]) cylinder(r=2.5/2, h=15, $fn=100);
        translate([SBW+4.75, SBD/2-5, SBH-15]) cylinder(r=2.5/2, h=15, $fn=100);
        translate([SBW+4.75, SBD/2+5, SBH-15]) cylinder(r=2.5/2, h=15, $fn=100);

    }
    
}
}


module mokuneji()
{
difference()
{
    union()
    {
        translate([0, 0, 5+2-gap1]) cylinder(r=9/2, h=40, $fn=100);
        translate([0, 0, 5]) cylinder(r2=9/2, r1=5/2, h=2, $fn=100);
        translate([0, 0, 5-40+gap1]) cylinder(r=5/2, h=40, $fn=100);
    }
}
}


module bolt()
{
difference()
{
    union()
    {
        translate([0, 4, -30-2+gap2]) cylinder(r=3.1/2, h=30, $fn=100);
        translate([0, 4, -2+gap1]) cylinder(r1=3.1/2, r2=6/2, h=2, $fn=100);
    }
}
}

module nat()
{
difference()
{
    union()
    {
        translate([0, 4, -3-5-th]) cylinder(r=3.1/2, h=3+10+5, $fn=100);
        translate([0, 4, -3-th]) cylinder(r=6.5/2, h=3, $fn=6);
        translate([0, 4/2, -3/2-th]) cube([6.5, 4, 3], center=true);
    }
}
}


module bot()
{
difference()
{
    union()
    {
        translate([BTW/2-6/2, -8, -1-6]) cube([6, 8+11, BTH+1+6]);
        
        translate([12/2, 12/2, 0])
        minkowski()
        {
            cube([BTW-12, BTD-12, 1]);
            cylinder(r=12/2, h=BTH-1, $fn=100);
        }
        translate([12/2, 12/2, -1])
        minkowski()
        {
            cube([BTW-12, 24-2, 1/2]);
            cylinder(r=12/2, h=1/2, $fn=100);
        }
    }
}
}


module atom()
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([ATW, ATD, ATH]);
        translate([ATW/2-18/2, ATD-gap1, 0]) cube([18, 12, ATH]);
        
        translate([ATW, ATD, 0])
        rotate([90, 0, -90])
        rotate_extrude(angle=-2.3, convexity=10, $fn=1000)
        translate([0, 0, 0]) square([ATW, ATD]);
    }

}
}