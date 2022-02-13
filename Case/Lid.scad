$fn=100;
difference() {
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