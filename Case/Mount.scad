$fn=100;
translate([0,0,1])
difference() {
translate([0,0,-1])
cube(
  size=[85,56,3],
  center=false
);
// SW
translate([
    2.7/2+2.15,
    2.7/2+2.15,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
// NW
translate([
    2.7/2+2.15,
    56-2.7/2-2.15,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
// SE
translate([
    2.7/2+2.15+57.95,
    2.7/2+2.15,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
// NE
translate([
    2.7/2+2.15+57.95,
    56-2.7/2-2.15,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
// RTC holes
translate([
    2.7/2+2.15+20.3,
    2.7/2+2.15,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    2.7/2+2.15+20.3,
//    2.7/2+2.15,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// temp1 NE
translate([
    2.7/2+2.15+57.95,
    2.7/2+2.15+12.7,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    2.7/2+2.15+57.95,
//    2.7/2+2.15+12.7,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// temp1 SW
translate([
    2.7/2+2.15+57.95-20.375,
    2.7/2+2.15,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    2.7/2+2.15+57.95-20.375,
//    2.7/2+2.15,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// temp1 NW
translate([
    2.7/2+2.15+57.95-20.375,
    2.7/2+2.15+12.7,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    2.7/2+2.15+57.95-20.375,
//    2.7/2+2.15+12.7,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// temp2 SW
translate([
    85-2.15-2.7/2-12.7,
    2.7/2+2.15+14.3125,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    85-2.15-2.7/2-12.7,
//    2.7/2+2.15+14.3125,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// temp2 NW
translate([
    85-2.15-2.7/2-12.7,
    2.7/2+2.15+14.3125+20.375,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    85-2.15-2.7/2-12.7,
//    2.7/2+2.15+14.3125+20.375,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// temp2 SE
translate([
    85-2.15-2.7/2,
    2.7/2+2.15+14.3125,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    85-2.15-2.7/2,
//    2.7/2+2.15+14.3125,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// temp2 NE
translate([
    85-2.15-2.7/2,
    2.7/2+2.15+14.3125+20.375,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    85-2.15-2.7/2,
//    2.7/2+2.15+14.3125+20.375,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// co2 SW
translate([
    2.7/2+2.15,
    56-2.7/2-2.15-20.3,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    2.7/2+2.15,
//    56-2.7/2-2.15-20.3,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// co2 SE
translate([
    2.7/2+2.15+45.75,
    56-2.7/2-2.15-20.3,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    2.7/2+2.15+45.75,
//    56-2.7/2-2.15-20.3,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
// co2 NE
translate([
    2.7/2+2.15+45.75,
    56-2.7/2-2.15,
    -5
    ])
cylinder(
  h=10,
  r=2.7/2,
  center=false
);
//translate([
//    2.7/2+2.15+45.75,
//    56-2.7/2-2.15,
//    -2.001
//    ])
//cylinder(
//    h=1,
//    r1=2.1,
//    r2=1.1,
//    center=false
//);
translate([7,7,1.8])
linear_extrude(4)
text("RTC",5);
translate([20,40,1.8])
linear_extrude(4)
text("CO2",5);
translate([78,17,1.8])
rotate(90,[0,0,1])
linear_extrude(4)
text("Temp 2",5);
translate([40,7,1.8])
linear_extrude(4)
text("Temp 1",5);

difference() {
    cube([4,4,7],center=true);
    translate([2,2,-4])
    cylinder(h=8,r=2);
}
translate([85,0,0])
rotate(90,[0,0,1])
difference() {
    cube([4,4,7],center=true);
    translate([2,2,-4])
    cylinder(h=8,r=2);
}
translate([0,56,0])
rotate(-90,[0,0,1])
difference() {
    cube([4,4,7],center=true);
    translate([2,2,-4])
    cylinder(h=8,r=2);
}
translate([85,56,0])
rotate(180,[0,0,1])
difference() {
    cube([4,4,7],center=true);
    translate([2,2,-4])
    cylinder(h=8,r=2);
}
}







// rpi lng: 60.65 - 55.25 = 57.95
// rpi srt: 51.7  - 46.3  = 49

// co2 lng: 48.25 - 43.25 = 45.75
// co2 srt: 22.75 - 17.85 = 20.3

// tmp lng: 22.75 - 18    = 20.375
// tmp srt: 15.15 - 10.25 = 12.7

// rtc lng: 23.3  - 17.3  = 20.3












