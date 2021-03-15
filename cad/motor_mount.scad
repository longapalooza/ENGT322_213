min_T = 5;

motor_D = 30;
motor_offset = 30;

gap_T = 1.5;

bolt1_D = 5.25;
bolt1_HD = 9;

bolt2_D = 6.75;
bolt2_HW = 11.5;
bolt2_HD = 2*bolt2_HW/sqrt(3);

mount_T = 20;
mount_L = 2*bolt1_HD + bolt2_HD + 8*min_T + motor_D;

difference(){
union(){
  cube([mount_T, mount_L, min_T]);

  translate([0, motor_D/2 +min_T + bolt1_HD + 2*min_T, motor_offset])
  rotate([0, 90, 0])
  cylinder(d = motor_D + 2*min_T, h = mount_T, $fn = 64);

  translate([0, bolt1_HD + 2*min_T, 0])
  cube([mount_T, motor_D/2 + min_T, motor_offset]);

  translate([0, motor_D/2 + 3*min_T + bolt1_HD, 0])
  cube([mount_T, motor_D/2 + 3*min_T + bolt2_HD, motor_offset + gap_T/2 + min_T]);
}

translate([mount_T/2, min_T + bolt1_D/2, -0.1])
cylinder(d = bolt1_D, h = min_T + 0.2, $fn = 32);

translate([mount_T/2, mount_L - min_T - bolt1_D/2, -0.1])
cylinder(d = bolt1_D, h = min_T + 0.2, $fn = 32);

translate([mount_T/2, mount_L - 3*min_T - bolt1_HD - bolt2_HD/2, -0.1])
cylinder(d = bolt2_HD, h = motor_offset - gap_T/2 - min_T + 0.1, $fn = 6);

translate([mount_T/2, mount_L - 3*min_T - bolt1_HD - bolt2_HD/2, 0])
cylinder(d = bolt2_D, h = motor_offset + gap_T/2 + min_T + 0.1, $fn = 32);

translate([-0.1, motor_D/2 + bolt1_HD + 3*min_T, motor_offset - gap_T/2])
cube([mount_T + 0.2, motor_D/2 + 3*min_T + bolt2_HD + 0.1, gap_T]);

translate([-0.1, motor_D/2 + bolt1_HD + 3*min_T, motor_offset])
rotate([0, 90, 0])
cylinder(d = motor_D, h = mount_T + 0.2, $fn = 64);
}