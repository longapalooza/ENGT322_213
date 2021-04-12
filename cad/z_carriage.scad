include <common.scad>

D = 4.1;
HW = 7.82;
Clamp = 6.8;

height = 120;
N_holes = 5;
hole_spacing = 25;

theta = 150;                               // angle enclosed by flat sides, inner radius

R = 35;                                    // radius of curved surface, outer radius
wall_T = 5;                                // wall thickness at peak curved surface

L1 = 37;                                   // arc length of curved surface, point to point
L2 = 8;                                    // length of flat sides

ix = (L1/2)/tan(theta/2);                  // x leg of inner radius
ih = (L1/2)/sin(theta/2);                  // hypotenuse of inner radius
ox = sqrt(pow(R, 2) - pow(L1/2, 2));       // x leg of outer radius

hole_chm = chm2;

$fn = 64;

difference(){
  union(){
    // mpcnc face solid
    translate([(ox - ix) - R - wall_T, 0, 0])
    linear_extrude(height = height)
    projection()
    difference(){
      union(){
        rotate([0, 0, -theta/2])
        chamfer_square(L2 + ih, 2);
        
        rotate([0, 0, - (180 - theta)/2])
        chamfer_square(L2 + ih, 2);
      }
      
      translate([-(ox - ix), 0, -0.1])
      cylinder(r = R, h = 1.2, $fn = 128);
      
      translate([-(ox - ix) + R + wall_T, -L2 - ih - 0.1, -0.1])
      cube([2*(L2 + ih + 0.1), 2*(L2 + ih + 0.1), 1.2]);
    }
    
    // bearing and lead screw nut solid
    linear_extrude(height = height/2)
    projection()
    union(){
      translate([nema_W/2 + 2*exterior_padding, 0, 0])
      hull(){
        translate([0, nema_BD/2 + interior_z_padding + rod_D/2 + rod_fit/2, 0])
        cylinder(d = line_OD + 2*line_fit + 2*exterior_padding, h = 1, $fn = 64);

        translate([0, -(nema_BD/2 + interior_z_padding + rod_D/2 + rod_fit/2), 0])
        cylinder(d = line_OD + 2*line_fit + 2*exterior_padding, h = 1, $fn = 64);
      }

      difference(){
        translate([-1, -L1/2, 0])
        cube([nema_W/2 + 2*exterior_padding + 1, L1, 1]);
        
        translate([(nema_W/2 + exterior_padding - line_OD/2 - line_fit)/2, L1/2, -0.1])
        cylinder(d = nema_W/2 + exterior_padding - line_OD/2 - line_fit, h = 1.2, $fn = 64);
        
        translate([(nema_W/2 + exterior_padding - line_OD/2 - line_fit)/2, -L1/2, -0.1])
        cylinder(d = nema_W/2 + exterior_padding - line_OD/2 - line_fit, h = 1.2, $fn = 64);
      }
    }
  }
  
  // mpcnc holes
  for(i = [0:N_holes - 1]){
    translate([-R - wall_T + (ox - ix), 0, (height - (N_holes - 1)*hole_spacing)/2 + i*hole_spacing])
    rotate([0, 0, theta/2])
    translate([ih + L2/2, 0, 0])
    rotate([90, 0, 0]){
      translate([0, 0, -0.1])
      cylinder(d = D, h = 3*wall_T + 0.1, $fn = 32);
      
      translate([0, 0, Clamp])
      rotate([0, 0, 30])
      cylinder(d = 2*HW/sqrt(3), h = 3*wall_T - Clamp, $fn = 6);
    }
  }
  
  for(i = [0:N_holes - 1]){
    translate([-R - wall_T + (ox - ix), 0, (height - (N_holes - 1)*hole_spacing)/2 + i*hole_spacing])
    rotate([0, 0, -theta/2])
    translate([ih + L2/2, 0, 0])
    rotate([-90, 0, 0]){
      translate([0, 0, -0.1])
      cylinder(d = D, h = 3*wall_T + 0.1, $fn = 32);
      
      translate([0, 0, Clamp])
      rotate([0, 0, 30])
      cylinder(d = 2*HW/sqrt(3), h = 3*wall_T - Clamp, $fn = 6);
    }
  }
  
  // linear bearing holes
  translate([nema_W/2 + 2*exterior_padding, nema_BD/2 + interior_z_padding + rod_D/2 + rod_fit/2, 0])
  rotate([0, -90, 0]){
    rotate([0, 90, 0])
    translate([0, 0, -0.1])
    cylinder(d = line_OD + line_fit, h = height/2 + 0.2);
    
    rotate([0, -90, 0])
    chamfer_cut(line_OD + line_fit, hole_chm);
    
    translate([height/2, 0, 0])
    rotate([0, 90, 0])
    chamfer_cut(line_OD + line_fit, hole_chm);
  }
  
  translate([nema_W/2 + 2*exterior_padding, -(nema_BD/2 + interior_z_padding + rod_D/2 + rod_fit/2), 0])
  rotate([0, -90, 0]){
    rotate([0, 90, 0])
    translate([0, 0, -0.1])
    cylinder(d = line_OD + line_fit, h = height/2 + 0.2);
    
    rotate([0, -90, 0])
    chamfer_cut(line_OD + line_fit, hole_chm);
    
    translate([height/2, 0, 0])
    rotate([0, 90, 0])
    chamfer_cut(line_OD + line_fit, hole_chm);
  }
  
  // linear bearing relief slots
  translate([nema_W/2 + 2*exterior_padding, nema_BD/2 + interior_z_padding + rod_D/2 + rod_fit/2, -0.1])
  cube([1, line_OD + line_fit + exterior_padding, height/2 + 0.2]);
  
  translate([nema_W/2 + 2*exterior_padding, -(nema_BD/2 + interior_z_padding + rod_D/2 + rod_fit/2) - (line_OD + line_fit + exterior_padding), -0.1])
  cube([1, line_OD + line_fit + exterior_padding, height/2 + 0.2]);
  
  // lead screw nut hole
  translate([nema_W/2 + 2*exterior_padding, 0, 0])
  rotate([0, -90, 0]){
    rotate([0, 90, 0])
    translate([0, 0, -0.1])
    cylinder(d = lnut_D1 + lnut_fit, h = height/2 + 0.2);
    
    rotate([0, -90, 0])
    chamfer_cut(lnut_D1 + lnut_fit, hole_chm);
    
    translate([height/2, 0, 0])
    rotate([0, 90, 0])
    chamfer_cut(lnut_D1 + lnut_fit, hole_chm);
  }
  
  // lead screw nut screw holes
  translate([nema_W/2 + 2*exterior_padding, 0, 0])
  rotate([0, -90, 0])
  for(i = [0:lnut_NS - 1]){
    rotate([i*(360/lnut_NS) + 45, 0, 0])
    translate([0, 0, lnut_SPD/2]){
      rotate([0, 90, 0])
      translate([0, 0, -0.1])
      cylinder(d = lnut_MSD - lnut_S_fit, h = height/2 + 0.2);
      
      rotate([0, -90, 0])
      chamfer_cut(lnut_MSD - lnut_S_fit, hole_chm);
      
      translate([height/2, 0, 0])
      rotate([0, 90, 0])
      chamfer_cut(lnut_MSD - lnut_S_fit, hole_chm);
    }
  }
}

















module chamfer_square(w, c){
  translate([c/sqrt(2), c/sqrt(2), 0])
   hull(){
    cylinder(r = c/sqrt(2), h = 1, $fn = 4);
    
    translate([w - 2*c/sqrt(2), 0, 0])
    cylinder(r = c/sqrt(2), h = 1, $fn = 4);
    
    translate([w - 2*c/sqrt(2), w - 2*c/sqrt(2), 0])
    cylinder(r = c/sqrt(2), h = 1, $fn = 4);
    
    translate([0, w - 2*c/sqrt(2), 0])
    cylinder(r = c/sqrt(2), h = 1, $fn = 4);
  }
}