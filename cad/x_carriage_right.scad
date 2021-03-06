include <common.scad>

x_carriage_right(true);

module x_carriage_right(print_orientation = false){
  LX = x_carriage_right_LX;
  LY = x_carriage_right_LY;
  LZ = x_carriage_right_LZ;

  corner_chm_leg = chamfer_leg(corner_chamfer);
  hole_chm = x_carriage_hole_chamfer;

  $fn = 64;
  
  color(filament_color)
  if(print_orientation){
    rotate([90, 0, 90])
    main();
  } else {
    main();
  }
  
  module main(){
    difference(){
      // main body
      hull(){
        // vertical structure
        // x min, y min, along z
        translate([corner_chm_leg, corner_chm_leg, corner_chm_leg])
        cylinder(r = corner_chm_leg, h = LZ - x_carriage_corner_chamfer_leg - 2*corner_chm_leg, $fn = 4);
        
        // x min, y max, along z
        translate([corner_chm_leg, LY - corner_chm_leg, corner_chm_leg])
        cylinder(r = corner_chm_leg, h = LZ - x_carriage_corner_chamfer_leg - 2*corner_chm_leg, $fn = 4);
        
        // x max, y min, along z
        translate([LX - corner_chm_leg, corner_chm_leg, corner_chm_leg])
        cylinder(r = corner_chm_leg, h = LZ - 2*corner_chm_leg, $fn = 4);
        
        // x max, y max, along z
        translate([LX - corner_chm_leg, LY - corner_chm_leg, corner_chm_leg])
        cylinder(r = corner_chm_leg, h = LZ - 2*corner_chm_leg, $fn = 4);
        
        // x midway, y min, along z
        translate([x_carriage_corner_chamfer_leg + corner_chm_leg, corner_chm_leg, corner_chm_leg])
        cylinder(r = corner_chm_leg, h = LZ - 2*corner_chm_leg, $fn = 4);
        
        // x midway, y max, along z
        translate([x_carriage_corner_chamfer_leg + corner_chm_leg, LY - corner_chm_leg, corner_chm_leg])
        cylinder(r = corner_chm_leg, h = LZ - 2*corner_chm_leg, $fn = 4);
        
        // horizontal structure
        // x min, along y, z min
        translate([corner_chm_leg, corner_chm_leg, corner_chm_leg])
        rotate([-90, 0, 0])
        cylinder(r = corner_chm_leg, h = LY - 2*corner_chm_leg, $fn = 4);
        
        // x max, along y, z min
        translate([LX - corner_chm_leg, corner_chm_leg, corner_chm_leg])
        rotate([-90, 0, 0])
        cylinder(r = corner_chm_leg, h = LY - 2*corner_chm_leg, $fn = 4);
        
        // x min, along y, z max - chamfer leg
        translate([corner_chm_leg, corner_chm_leg, LZ - x_carriage_corner_chamfer_leg - corner_chm_leg])
        rotate([-90, 0, 0])
        cylinder(r = corner_chm_leg, h = LY - 2*corner_chm_leg, $fn = 4);
        
        // x max, along y, z max
        translate([LX - corner_chm_leg, corner_chm_leg, LZ - corner_chm_leg])
        rotate([-90, 0, 0])
        cylinder(r = corner_chm_leg, h = LY - 2*corner_chm_leg, $fn = 4);
        
        // x midway, along y, z min
        translate([x_carriage_corner_chamfer_leg + corner_chm_leg, corner_chm_leg, corner_chm_leg])
        rotate([-90, 0, 0])
        cylinder(r = corner_chm_leg, h = LY - 2*corner_chm_leg, $fn = 4);
        
        // x midway, along y, z max
        translate([x_carriage_corner_chamfer_leg + corner_chm_leg, corner_chm_leg, LZ - corner_chm_leg])
        rotate([-90, 0, 0])
        cylinder(r = corner_chm_leg, h = LY - 2*corner_chm_leg, $fn = 4);
      }
      
      // lead screw nut screw holes
      translate([0, LY/2, exterior_padding + lnut_MSD/2 + lnut_SPD/2 + chamfer_leg(hole_chm)])
      for(i = [0:lnut_NS - 1]){
        rotate([i*(360/lnut_NS), 0, 0])
        translate([0, 0, lnut_SPD/2]){
          rotate([0, 90, 0])
          translate([0, 0, -0.1])
          cylinder(d = lnut_MSD - lnut_S_fit, h = LX + 0.2);
        
          rotate([0, -90, 0])
          chamfer_cut(lnut_MSD - lnut_S_fit, hole_chm);
          
          translate([LX, 0, 0])
          rotate([0, 90, 0])
          chamfer_cut(lnut_MSD - lnut_S_fit, hole_chm);
        }
      }
      
      // lead screw nut hole
      translate([0, LY/2, exterior_padding + lnut_MSD/2 + lnut_SPD/2 + chamfer_leg(hole_chm)]){
        rotate([0, 90, 0])
        translate([0, 0, -0.1])
        cylinder(d = lnut_D1 + lnut_fit, h = LX + 0.2);
        
        rotate([0, -90, 0])
        chamfer_cut(lnut_D1 + lnut_fit, hole_chm);
        
        translate([LX, 0, 0])
        rotate([0, 90, 0])
        chamfer_cut(lnut_D1 + lnut_fit, hole_chm);
      }
      
      // linear bearing hole
      translate([0, LY/2, exterior_padding + 3*chamfer_leg(hole_chm) + lnut_MSD + lnut_SPD + interior_z_padding + line_OD/2]){
        rotate([0, 90, 0])
        translate([0, 0, -0.1])
        cylinder(d = line_OD + line_fit, h = LX + 0.2);
        
        rotate([0, -90, 0])
        chamfer_cut(line_OD + line_fit, hole_chm);
        
        translate([LX, 0, 0])
        rotate([0, 90, 0])
        chamfer_cut(line_OD + line_fit, hole_chm);
      }
      
      // bearing rod holes
      translate([LX/2, 0, exterior_padding + 5*chamfer_leg(hole_chm) + lnut_MSD + lnut_SPD + 2*interior_z_padding + line_OD + rod_D/2]){
        rotate([-90, 0, 0]){
          translate([0, 0, exterior_padding])
          cylinder(d = rod_D + rod_fit, h = LY - exterior_padding + 0.1);
          
          translate([0, -x_carriage_rod_spacing, exterior_padding])
          cylinder(d = rod_D + rod_fit, h = LY - exterior_padding + 0.1);
        }
        
        translate([0, LY, 0])
        rotate([-90, 0, 0])
        chamfer_cut(rod_D + rod_fit, hole_chm);
        
        translate([0, LY, x_carriage_rod_spacing])
        rotate([-90, 0, 0])
        chamfer_cut(rod_D + rod_fit, hole_chm);
      }
      
      // NEMA boss hole
      translate([LX/2, -0.1, LZ - exterior_padding - chamfer_leg(hole_chm) - rod_D/2 - x_carriage_rod_spacing/2])
      rotate([-90, 0, 0])
      cylinder(d = nema_BD + nema_BD_fit, h = LY + 0.2);
      
      // NEMA mounting screw holes
      translate([LX/2, -0.1, LZ - exterior_padding - chamfer_leg(hole_chm) - rod_D/2 - x_carriage_rod_spacing/2])
      rotate([-90, 0, 0])
      for(i = [0:nema_NS - 1]){
        rotate([0, 0, i*(360/nema_NS)])
        translate([-nema_MSP/2, nema_MSP/2, 0]){
          cylinder(d = nema_MSD + nema_MSD_fit, h = LY + 0.2);
          
          translate([0, 0, x_carriage_nema_MS_CT + 0.1])
          cylinder(d = nema_MSHD + nema_MSHD_fit, h = LY - x_carriage_nema_MS_CT + 0.1);
        }
      }
    }
  }
}