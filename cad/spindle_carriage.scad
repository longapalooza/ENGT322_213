include <common.scad>

spindle_carriage(false);

module spindle_carriage(print_orientation = false){
  z_motor_mount_MS_CT = y_motor_mount_MS_CT;
  
  LX = nema_BD + 2*interior_z_padding + 2*rod_D + 2*rod_fit + 4*exterior_padding;
  LY1 = z_motor_mount_MS_CT + 2*exterior_padding + nema_W;
  LY2 = 3*exterior_padding + roll_OD/2 + roll_fit/2 + nema_W/2 + z_motor_mount_MS_CT;
  LZ = lead_LZ + exterior_padding + nema_SL + 5;
  
  corner_chm_leg = chamfer_leg(corner_chamfer);
  hole_chm = x_carriage_hole_chamfer;
  
  z_carriage_rod_spacing = nema_BD + 2*interior_z_padding + rod_D + rod_fit;

  $fn = 32;
  
  color (filament_color)
  if(print_orientation){
    translate([0, 0, 0])
    rotate([0, 0, 0])
    main();
  } else {
    main();
  }
  
  module main(){
    difference(){
      union(){
        // backing
        hull(){
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([LZ - corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = LZ - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), LX - corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = LZ - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([0, z_motor_mount_MS_CT - 2*corner_chamfer/sqrt(2), 0]){
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([LZ - corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            rotate([0, 90, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = LZ - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), LX - corner_chamfer/sqrt(2)])
            rotate([0, 90, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = LZ - 2*corner_chamfer/sqrt(2), $fn = 4);
          }
        }
        
        // motor mount, top side
        translate([LZ - y_motor_mount_MS_CT, 0, 0])
        hull(){
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([z_motor_mount_MS_CT - corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = z_motor_mount_MS_CT - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), LX - corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = z_motor_mount_MS_CT - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([0, LY1 - 2*corner_chamfer/sqrt(2), 0]){
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([z_motor_mount_MS_CT - corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            rotate([0, 90, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = z_motor_mount_MS_CT - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), LX - corner_chamfer/sqrt(2)])
            rotate([0, 90, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = z_motor_mount_MS_CT - 2*corner_chamfer/sqrt(2), $fn = 4);
          }
        }
        
        // lead screw support, bottom side
        hull(){
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([roll_T + exterior_padding - corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = roll_T + exterior_padding - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), LX - corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = roll_T + exterior_padding - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([0, LY2 - 2*corner_chamfer/sqrt(2), 0]){
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([roll_T + exterior_padding - corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            cylinder(r = corner_chamfer/sqrt(2), h = LX - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
            rotate([0, 90, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = roll_T + exterior_padding - 2*corner_chamfer/sqrt(2), $fn = 4);
            
            translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), LX - corner_chamfer/sqrt(2)])
            rotate([0, 90, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = roll_T + exterior_padding - 2*corner_chamfer/sqrt(2), $fn = 4);
          }
        }
        
        // bearing and lead screw nut solid, back
        hull(){
          translate([corner_chamfer/sqrt(2), z_motor_mount_MS_CT/2, corner_chamfer/sqrt(2)])
          rotate([90, 0, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = line_OD/2 + line_fit/2 + z_motor_mount_MS_CT/2 + exterior_padding, $fn = 4);
          
          translate([4*exterior_padding + line_OD + line_fit + x_carriage_rod_spacing - corner_chamfer/sqrt(2), z_motor_mount_MS_CT/2, corner_chamfer/sqrt(2)])
          rotate([90, 0, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = line_OD/2 + line_fit/2 + z_motor_mount_MS_CT/2 + exterior_padding, $fn = 4);
          
          translate([0, 0, LX - 2*corner_chamfer/sqrt(2)]){
            translate([corner_chamfer/sqrt(2), z_motor_mount_MS_CT/2, corner_chamfer/sqrt(2)])
            rotate([90, 0, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = line_OD/2 + line_fit/2 + z_motor_mount_MS_CT/2 + exterior_padding, $fn = 4);
            
            translate([4*exterior_padding + line_OD + line_fit + x_carriage_rod_spacing - corner_chamfer/sqrt(2), z_motor_mount_MS_CT/2, corner_chamfer/sqrt(2)])
            rotate([90, 0, 0])
            cylinder(r = corner_chamfer/sqrt(2), h = line_OD/2 + line_fit/2 + z_motor_mount_MS_CT/2 + exterior_padding, $fn = 4);
          }
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = LZ - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([corner_chamfer/sqrt(2), corner_chamfer/sqrt(2), LX - corner_chamfer/sqrt(2)])
          rotate([0, 90, 0])
          cylinder(r = corner_chamfer/sqrt(2), h = LZ - 2*corner_chamfer/sqrt(2), $fn = 4);
          
          translate([2*exterior_padding + line_OD/2 + line_fit/2, -(line_OD + line_fit)/2 - exterior_padding, 0])
          cylinder(d1 = line_OD + line_fit + 4*exterior_padding - 2*corner_chamfer/sqrt(2),
                   d2 = line_OD + line_fit + 4*exterior_padding,
                   h = corner_chamfer/sqrt(2));
          
          translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing, -(line_OD + line_fit)/2 - exterior_padding, 0])
          cylinder(d1 = line_OD + line_fit + 4*exterior_padding - 2*corner_chamfer/sqrt(2),
                   d2 = line_OD + line_fit + 4*exterior_padding,
                   h = corner_chamfer/sqrt(2));
          
          translate([0, 0, LX - corner_chamfer/sqrt(2)]){
            translate([2*exterior_padding + line_OD/2 + line_fit/2, -(line_OD + line_fit)/2 - exterior_padding, 0])
            cylinder(d2 = line_OD + line_fit + 4*exterior_padding - 2*corner_chamfer/sqrt(2),
                     d1 = line_OD + line_fit + 4*exterior_padding,
                     h = corner_chamfer/sqrt(2));
            
            translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing, -(line_OD + line_fit)/2 - exterior_padding, 0])
            cylinder(d2 = line_OD + line_fit + 4*exterior_padding - 2*corner_chamfer/sqrt(2),
                     d1 = line_OD + line_fit + 4*exterior_padding,
                     h = corner_chamfer/sqrt(2));
          }
        }
      }
      
      // linear bearing holes
      translate([2*exterior_padding + line_OD/2 + line_fit/2, -(line_OD + line_fit)/2 - exterior_padding, 0]){
        translate([0, 0, -0.1])
        cylinder(d = line_OD + line_fit, h = LX + 0.2);
        
        rotate([0, 180, 0])
        chamfer_cut(line_OD + line_fit, hole_chm);
        
        translate([0, 0, LX])
        chamfer_cut(line_OD + line_fit, hole_chm);
      }
      
      translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing, -(line_OD + line_fit)/2 - exterior_padding, 0]){
        translate([0, 0, -0.1])
        cylinder(d = line_OD + line_fit, h = LX + 0.2);
        
        rotate([0, 180, 0])
        chamfer_cut(line_OD + line_fit, hole_chm);
        
        translate([0, 0, LX])
        chamfer_cut(line_OD + line_fit, hole_chm);
      }
      
      // lead screw nut hole
      //translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing/2, -(line_OD + line_fit)/2 - exterior_padding, 0]){
      translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing/2 - (lnut_MSD - lnut_SHD), -(line_OD + line_fit)/2 - exterior_padding, 0]){
        translate([0, 0, -0.1])
        cylinder(d = lnut_D1 + lnut_fit, h = LX + 0.2);
        
        rotate([0, 180, 0])
        chamfer_cut(lnut_D1 + lnut_fit, hole_chm);
        
        translate([0, 0, LX])
        chamfer_cut(lnut_D1 + lnut_fit, hole_chm);
      }
      
      // lead screw nut screw holes
      //translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing/2, -(line_OD + line_fit)/2 - exterior_padding, 0])
      translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing/2 - (lnut_MSD - lnut_SHD), -(line_OD + line_fit)/2 - exterior_padding, 0])
      for(i = [0:lnut_NS - 1]){
        rotate([0, 0, i*(360/lnut_NS) + 45])
        translate([lnut_SPD/2, 0, 0]){
          translate([0, 0, -0.1])
          cylinder(d = lnut_MSD - lnut_S_fit, h = LX + 0.2);
        
          rotate([0, 180, 0])
          chamfer_cut(lnut_MSD - lnut_S_fit, hole_chm);
          
          translate([0, 0, LX])
          chamfer_cut(lnut_MSD - lnut_S_fit, hole_chm);
        }
      }
      
      // NEMA boss hole
      translate([LZ + 0.1, z_motor_mount_MS_CT + exterior_padding + nema_W/2, LX/2])
      rotate([0, -90, 0])
      cylinder(d = nema_BD + nema_BD_fit, h = z_motor_mount_MS_CT + 0.2);
      
      // NEMA mounting screw holes
      translate([LZ + 0.1, z_motor_mount_MS_CT + exterior_padding + nema_W/2, LX/2])
      rotate([0, -90, 0])
      for(i = [0:nema_NS - 1]){
        rotate([0, 0, i*(360/nema_NS)])
        translate([-nema_MSP/2, nema_MSP/2, 0])
        cylinder(d = nema_MSD + nema_MSD_fit, h = z_motor_mount_MS_CT + 0.2);
      }
      
      // roller bearing hole
      translate([exterior_padding + roll_T, z_motor_mount_MS_CT + exterior_padding + nema_W/2, LX/2]){
        rotate([0, -90, 0])
        cylinder(d = roll_OD + roll_fit, h = roll_T + chamfer_leg(hole_chm));
      
        rotate([0, 90, 0])
        chamfer_cut(roll_OD + roll_fit, hole_chm);
      }
      
      // bearing rod holes
      translate([0, z_motor_mount_MS_CT + exterior_padding + nema_W/2, LX/2 - z_carriage_rod_spacing/2]){
        rotate([0, 90, 0]){
          translate([0, 0, -0.1])
          cylinder(d = rod_D + rod_fit, h = exterior_padding + roll_T + 0.2);
          
          translate([-z_carriage_rod_spacing, 0, -0.1])
          cylinder(d = rod_D + rod_fit, h = exterior_padding + roll_T + 0.2);
        }
        
        rotate([0, -90, 0])
        chamfer_cut(rod_D + rod_fit, hole_chm);
        
        translate([0, 0, z_carriage_rod_spacing])
        rotate([0, -90, 0])
        chamfer_cut(rod_D + rod_fit, hole_chm);
      }
      
      translate([LZ - z_motor_mount_MS_CT, z_motor_mount_MS_CT + exterior_padding + nema_W/2, LX/2 - z_carriage_rod_spacing/2]){
        rotate([0, 90, 0]){
          translate([0, 0, -0.1])
          cylinder(d = rod_D + rod_fit, h = z_motor_mount_MS_CT - exterior_padding + 0.1);
          
          translate([-z_carriage_rod_spacing, 0, -0.1])
          cylinder(d = rod_D + rod_fit, h = z_motor_mount_MS_CT - exterior_padding + 0.1);
        }
        
        rotate([0, -90, 0])
        chamfer_cut(rod_D + rod_fit, hole_chm);
        
        translate([0, 0, z_carriage_rod_spacing])
        rotate([0, -90, 0])
        chamfer_cut(rod_D + rod_fit, hole_chm);
      }
      
      // linear bearing relief slots
      translate([2*exterior_padding + line_OD/2 + line_fit/2, -(line_OD + line_fit)/2 - exterior_padding, 0])
      rotate([0, 0, -135])
      translate([0, -0.5, -0.1])
      cube([line_OD + exterior_padding, 1, LX + 0.2]);
      
      translate([2*exterior_padding + line_OD/2 + line_fit/2 + x_carriage_rod_spacing, -(line_OD + line_fit)/2 - exterior_padding, 0])
      rotate([0, 0, -90])
      translate([0, -0.5, -0.1])
      cube([line_OD + exterior_padding, 1, LX + 0.2]);
    }
  }
}