//
// ktRACK43
//
 
gap1 = 0.001;
gap2 = 0.002;
th = 2;

//servo
SBW = 40;
SBD = 20;
SBH = 41;

//bot
BTW = 43;
BTD = 37;
BTH = 24;

//atom
ATW = 24+1;
ATD = 24+1;
ATH = 9.5+0.5;



//#translate([-1250, 0, -5]) cube([2000, 5, 5]);
translate([-3, 0, 6]) rotate([0, 0, 17])
arm();
base();
futa();

module futa()
{
difference()
{
    union()
    {
        //case
        translate([(SBD+30)/2+10, 0-5, -12-35-17-9])
        rotate([0, 0, 180]){
        translate([10, -15, 0]) cube([50, 45, th]);
        translate([-48, -5, 0]) cube([108, 35, th]);
        translate([-65, -5, 0]) cube([25, 18, th]);
        translate([-60+gap1, 2-gap1, -gap1]) cube([27, ATH, BTW+th*2-36+gap2]);
        translate([-40-20+ATW, th, 12-1]) cube([th, ATH, 2.5+1]);
        translate([-33+1/2, -5, 0]) cube([43-1, th, 45-0.5]);
        }
    }
    
    //nat->bolt
    translate([65+10, -21-5, -35-17-9-10]) rotate([0, 0, -90]) bolt();
    translate([(SBD+30)/2, -19.5, -(SBH+15+15)-10+5+5]) rotate([0, 0, 90]) bolt();
    translate([-(SBD+30)/2, -19.5, -(SBH+15+15)-10+5+5]) rotate([0, 0, -90]) bolt();
}
}

module arm()
{
difference()
{
    union()
    {
        translate([-34, 0, -16-60/2+3/2]) rotate([0, 0, 0]) cube([14, 20, 60-3], center=true);
        translate([-34+14/2, -20/2, -16]) rotate([0, 180, -12.3]) cube([14, 20, 60-3]);
        translate([-230+2.2, -10/2, -16-60/2+3/2]) cube([24, 10, 60-3], center=true);
        translate([-210/2-27, -10/2, -16-5/2]) cube([210, 10, 5], center=true);
        translate([-210/2-27, -10/2, -16-5/2-60+5+3]) cube([210, 10, 5], center=true);
        
        translate([-27, 20/2, -16-5]) rotate([0, 0, 180-15]) cube([240, 10, 5]);
        translate([-27, 20/2, -16-60+3]) rotate([0, 0, 180-15]) cube([240, 10, 5]);
        
        translate([-27-200, -20/2, -16]) rotate([0, 180, -63.5]) cube([88, 10, 5]);
        translate([-27-200, -20/2, -16-60+5+3]) rotate([0, 180, -63.5]) cube([88, 10,5]);
    }
    
    translate([-34+14/2-14, -20/2, -16-5]) rotate([0, 180, -12.3]) cube([14, 30, 60-10-3]);
    translate([-27-200+11.2, -20/2, -16-5]) rotate([0, 180, -63.5]) cube([88, 10, 60-5*2-3]);
    
    translate([-27-200, -20/2, -16-60-gap1]) rotate([0, 0, 180-63.5]) cube([93, 50, 60+gap2]);
    
    translate([-25,  -10/2,  -81+21]) rotate([0, 0, -12.3]) 
    {
        translate([0,  0, 30]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
        translate([0, 10, 30]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
        translate([0,  0, 20]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
        translate([0, 10, 20]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
        translate([0,  0, 10]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
        translate([0, 10, 10]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
        translate([0,  0,  0]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
        translate([0, 10,  0]) rotate([0, -90, 0]) cylinder(r=3.2/2, h=20, $fn=100);
    }
}
translate([-27-240+10, 65, -16-5]) cylinder(r=20/2, h=5, $fn=100);
translate([-27-240+10, 65, -16-60+3]) cylinder(r=20/2, h=5, $fn=100);
}



module base()
{
difference()
{
    union()
    {
        translate([-(SBD+30)/2, -(SBW+5)+10, -(SBH+15+15)-10+10]) cube([SBD+30, SBW+5, SBH+15+15+10-10]);
        
        translate([(SBD+30)/2+10, 0-5, -35-17-9]) rotate([0, 0, 180]) case();
    }
    translate([0, gap1, -(SBH+15+15)/2-10+5]) rotate([0, 0, -90]) servo();
    translate([-25, 0, -10+gap1]) cube([50, 20, 10]);
    
    //mokuneji
    translate([-(SBD+30)/2+6, -SBW+5+6, 0]) mokuneji();
    translate([(SBD+30)/2-6, -SBW+5+6, 0]) mokuneji();
    translate([(SBD+30)/2-6, -SBW+5+6+19, 0]) mokuneji();
    
    //wire
    translate([0, -20, -33]) rotate([0, 90, 0]) cylinder(r=9/2, h=30, $fn=100);
    translate([30, -4, -40]) cylinder(r=10/2, h=30, $fn=100);
    
    //nat
    translate([65+10, -21-5, -35-17-9-10]) rotate([0, 0, -90]) nat();
    translate([(SBD+30)/2, -19.5, -(SBH+15+15)-10+5+5]) rotate([0, 0, 90]) nat();
    translate([-(SBD+30)/2, -19.5, -(SBH+15+15)-10+5+5]) rotate([0, 0, -90]) nat();
    
    //kado
    translate([0, gap1, -(SBH+15+15)/2-10+5]) rotate([0, 0, -90]) 
    difference()
    {
        union()
        {
        rotate([0, 0, 180+97]) translate([50/2, 0, 0]) cube([50, 22, SBH], center=true);
        rotate([0, 0, 180+90]) translate([50/2, 0, 0]) cube([50, 22, SBH], center=true);
        rotate([0, 0, 180+60]) translate([50/2, 0, 0]) cube([50, 22, SBH], center=true);
        rotate([0, 0, 180]) translate([50/2, 0, 0]) cube([50, 22, SBH], center=true);
        rotate([0, 0, 180-66.5+2.5]) translate([50/2, 0, 0]) cube([50, 22, SBH], center=true);
        }
        translate([0, 0, -(SBH+15+15)/2]) cylinder(r=22, h=SBH+15+15, $fn=100);
    }
    
    //kesu
    //#translate([25, -200, -200]) cube([200, 200, 200]);
    //#translate([-25, -50, -23]) cube([200, 200, 200]);
    //#translate([-25, -50, -200-68]) cube([200, 200, 200]);
}
translate([0, gap1, -(SBH+15+15)/2-10]) rotate([0, 0, -90]) 
{
    rotate([0, 0, 180+97]) translate([50/2-5.5, 11/2, 0+5]) cube([5, 11, SBH], center=true);
    rotate([0, 0, 180-66.5+2.5]) translate([50/2-5.51, -11/2, 0+5]) cube([5, 11, SBH], center=true);
}
}
module case()
{
translate([0, 0, -12])
difference()
{
    union()
    {
        translate([-65, 0-5, 12-1-11]) cube([65+10, 30+5, 35+1+11]);
        translate([-70-20+1, 0, 0])
        rotate([-90, -90, 0])
        translate([12/2, 12/2, 0])
        minkowski()
        {
            cube([35, 30-1, 43-12-2]);
            cylinder(r=12/2, h=1, $fn=100);
        }
    }
    translate([-40-20, ATH+th, BTW+th-BTW/2+ATW/2]) rotate([90, 90, 0]) atom();
    translate([-30-20, 17, BTW+th]) rotate([90, 90, 180]) bot();
    translate([-70-5-20, -gap1, -gap1]) cube([30, 13+gap2, BTW+th*2+gap2]);
    translate([-33, th-5, -th+12-11]) cube([33+10, 30-th*2+5, 35+gap1+11]);
    translate([-33-9+th, th+ATH+th, 12-th-11]) cube([33, 30-th*2-ATH-th, 35+gap1+11]);
    translate([-40+gap1, 2-gap1+11, -gap1]) cube([7, 2, BTW+th*2-36+gap2]);
    
    //futa
    translate([10, -15, 0]) cube([50, 45, th]);
    translate([-48, -5, 0]) cube([108, 35, th]);
    translate([-65, -5, 0]) cube([25, 18, th]);
    translate([-60+gap1, 2-gap1, -gap1]) cube([27, 11, BTW+th*2-36+gap2]);
    translate([-40-20+ATW, th, 12-1]) cube([th, ATH, 2.5+1]);
    translate([-33, -5, 0]) cube([43, th, 45]);
}
translate([0, 0, -12])
translate([-30-20, th+0.5, BTW+th-BTW/2]) rotate([90, 90, 0]) cylinder(r2=4/2, r1=2/2, h=0.5, $fn=100);
}

module servo()
{
difference()
{
    union()
    {
        translate([0, 0, -(SBH+15+15)/2]) cylinder(r=20/2, h=SBH+15+15, $fn=100);
        translate([0, SBD/2+3/2, 7.5]) cube([SBW, 3, 6], center=true);
        translate([10, 0, 0])
        {
            cube([SBW, SBD, SBH], center=true);
            /*translate([SBW/2-2.5, 7.5, SBH/2]) {
                cylinder(r=2/2, h=th, $fn=100);
                translate([0, 0, th]) cylinder(r=4/2, h=15, $fn=100);}
            translate([SBW/2-2.5, -7.5, SBH/2]) {
                cylinder(r=2/2, h=th, $fn=100);
                translate([0, 0, th]) cylinder(r=4/2, h=15, $fn=100);}
            translate([SBW/2-17.5, 7.5, SBH/2]) {
                cylinder(r=2/2, h=th, $fn=100);
                translate([0, 0, th]) cylinder(r=4/2, h=15, $fn=100);}
            translate([SBW/2-17.5, -7.5, SBH/2]) {
                cylinder(r=2/2, h=th, $fn=100);
                translate([0, 0, th]) cylinder(r=4/2, h=15, $fn=100);}
            */
        
            translate([SBW/2-2.5, 0, -SBH/2-th]) {
                cylinder(r=2/2, h=th, $fn=100);
                translate([0, 0, -15]) cylinder(r=4/2, h=15, $fn=100);}
            translate([SBW/2-10, 7.5, -SBH/2-th]) {
                cylinder(r=2/2, h=th, $fn=100);
                translate([0, 0, -15]) cylinder(r=4/2, h=15, $fn=100);}
            translate([SBW/2-10, -7.5, -SBH/2-th]) {
                cylinder(r=2/2, h=th, $fn=100);
                translate([0, 0, -15]) cylinder(r=4/2, h=15, $fn=100);}
        }
        
        rotate([0, 0, 180+97]) translate([50/2, 0, SBH/2+(15+10)/2-5/2-9/2]) cube([50, 22, 15+10-5-9], center=true);
        rotate([0, 0, 180+90]) translate([50/2, 0, SBH/2+(15+10)/2-5/2-9/2]) cube([50, 22, 15+10-5-9], center=true);
        rotate([0, 0, 180+60]) translate([50/2, 0, SBH/2+(15+10)/2-5/2-9/2]) cube([50, 22, 15+10-5-9], center=true);
        rotate([0, 0, 180]) translate([50/2, 0, SBH/2+(15+10)/2-5/2-9/2]) cube([50, 22, 15-5-9], center=true);
        rotate([0, 0, 180-66.5+2.5]) translate([50/2, 0, SBH/2+(15+10)/2-5/2-9/2]) cube([50, 22, 15+10-5-9], center=true);
        //rotate([0, 0, 180-90]) translate([50/2, 0, SBH/2+(15+10)/2]) cube([50, 22, 15+10], center=true);
        //rotate([0, 0, 180-117]) translate([50/2, 0, SBH/2+(15+10)/2]) cube([50, 22, 15+10], center=true);
        translate([0, 0, SBH/2]) cylinder(r=(22+0)/2, h=15+10, $fn=100);
        
        rotate([0, 0, 180+97]) translate([50/2, 0, -SBH/2-15/2]) cube([50, 22, 15], center=true);
        rotate([0, 0, 180+90]) translate([50/2, 0, -SBH/2-15/2]) cube([50, 22, 15], center=true);
        rotate([0, 0, 180+60]) translate([50/2, 0, -SBH/2-15/2]) cube([50, 22, 15], center=true);
        rotate([0, 0, 180]) translate([50/2, 0, -SBH/2-15/2]) cube([50, 22, 15], center=true);
        rotate([0, 0, 180-66.5+2.5]) translate([50/2, 0, -SBH/2-15/2]) cube([50, 22, 15], center=true);
        //rotate([0, 0, 180-90]) translate([50/2, 0, -SBH/2-15/2]) cube([50, 22, 15], center=true);
        //rotate([0, 0, 180-117]) translate([50/2, 0, -SBH/2-15/2]) cube([50, 22, 15], center=true);
        translate([0, 0, -SBH/2-15]) cylinder(r=22/2, h=15, $fn=100);
    }
}
}


module mokuneji()
{
difference()
{
    union()
    {
        translate([0, 0, -5-gap1]) cylinder(r=5/2, h=40, $fn=100);
        translate([0, 0, -5]) cylinder(r1=9/2, r2=5/2, h=2, $fn=100);
        translate([0, 0, -5-100+gap1]) cylinder(r=9/2, h=100, $fn=100);
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



module bolt()
{
difference()
{
    union()
    {
        translate([0, 4, -30-2+gap2]) cylinder(r=6/2, h=30, $fn=100);
        translate([0, 4, -2+gap1]) cylinder(r2=3.1/2, r1=6/2, h=2, $fn=100);
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
        translate([0, 4, th]) cylinder(r=6.5/2, h=3, $fn=6);
        translate([0, 4/2, 3/2+th]) cube([6.5, 4, 3], center=true);
    }
}
}


/*
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
*/