include <common.scad>

y_motor_mount_right(true);

module y_motor_mount_right(print_orientation=false){
  LX=y_motor_mount_LX;
  LY=y_motor_mount_LY;
  LZ=y_motor_mount_LZ;

  chm=corner_chamfer;
  chm_leg=chamfer_leg(chm);

  $fn=64;
  
  color(filament_color)
  if(print_orientation){
    translate([beam_W, 0, LX])
    rotate([0, 90, 0])
    body();
  } else {
    body();
  }

  module body(){
    difference(){
      union(){
        hull(){
          translate([chm_leg, chm_leg, 0])
          cylinder(r=chm_leg, h=LZ-chm_leg, $fn=4);
          
          translate([chm_leg, LY-chm_leg, 0])
          cylinder(r=chm_leg, h=LZ-chm_leg, $fn=4);
          
          translate([chm_leg, chm_leg, LZ-chm_leg])
          rotate([0, 90, 0])
          cylinder(r=chm_leg, h=LX-chm_leg, $fn=4);

          translate([chm_leg, LY-chm_leg, LZ-chm_leg])
          rotate([0, 90, 0])
          cylinder(r=chm_leg, h=LX-chm_leg, $fn=4);
          
          translate([0, chm_leg, 0,])
          cube([chm_leg, LY-2*chm_leg, chm_leg]);
          
          translate([chm_leg, 0, 0,])
          cube([LX-chm_leg, chm_leg, chm_leg]);
          
          translate([chm_leg, LY-chm_leg, 0,])
          cube([LX-chm_leg, chm_leg, chm_leg]);
        }
        
        // outer mount flange
        translate([chm_leg, LY-beam_F_CT, 0])
        rotate([-90, 0, 0])
        hull(){
          cube([LX-chm_leg, 1, beam_F_CT]);

          translate([chm_leg, beam_W-chm_leg, 0])
          cylinder(r=chm_leg, h=beam_F_CT, $fn=4);

          translate([LX-2*chm_leg, beam_W-chm_leg, 0])
          cylinder(r=chm_leg, h=beam_F_CT, $fn=4);
        }
        
        // perpendicular mount flange
        translate([LX-beam_F_CT, LY-beam_F_CT-beam_W-beam_fit, 0])
        rotate([-90, 0, -90])
        hull(){
          cube([LY-beam_F_CT-beam_W-beam_fit, 1, beam_F_CT]);
          cube([1, beam_W, beam_F_CT]);

          translate([LY-beam_F_CT-beam_W-beam_fit-chm_leg, beam_W-chm_leg, 0])
          cylinder(r=chm_leg, h=beam_F_CT, $fn=4);
        }
        
        // inner mount flange
        translate([0, LY-2*beam_F_CT-beam_W-beam_fit, 0])
        rotate([-90, 0, 0])
        hull(){
          cube([LX, 1, beam_F_CT]);
          
          translate([LX-1, 0, 0])
          cube([1, beam_W, beam_F_CT]);

          translate([chm_leg, beam_W-chm_leg, 0])
          cylinder(r=chm_leg, h=beam_F_CT, $fn=4);
        }
        
        // mount flange chamfers
        translate([LX-beam_F_CT-chm_leg, LY-beam_F_CT-beam_W-beam_fit-beam_F_CT-chm_leg, -beam_W])
        difference(){
          cube([chm_leg+beam_F_CT, chm_leg+beam_F_CT, beam_W]);
          translate([0, 0, -0.1])
          cylinder(r=chm_leg, h=beam_W+0.2, $fn=4);
        }
        translate([0, LY-2*beam_F_CT-beam_W-beam_fit-chm_leg, -chm_leg])
        rotate([90, 0, 90])
        difference(){
          cube([chm_leg+beam_F_CT, chm_leg+beam_F_CT, LX]);
          translate([0, 0, -0.1])
          cylinder(r=chm_leg, h=LX+0.2, $fn=4);
        }
        translate([LX-beam_F_CT-chm_leg, LY-beam_F_CT-beam_W-beam_fit, -chm_leg])
        rotate([90, 0, 0])
        difference(){
          cube([chm_leg+beam_F_CT, chm_leg+beam_F_CT, LY-beam_F_CT-beam_W-beam_fit]);
          translate([0, 0, -0.1])
          cylinder(r=chm_leg, h=LY-beam_F_CT-beam_W-beam_fit+0.2, $fn=4);
        }
        
        // beam slot chamfers
        translate([chm_leg, LY-beam_F_CT-chamfer_leg(beam_chm), -chamfer_leg(beam_chm)])
        rotate([90, 0, 90])
        difference(){
          cube([chamfer_leg(beam_chm)+beam_F_CT, chamfer_leg(beam_chm)+beam_F_CT, LX-chm_leg]);
          translate([0, 0, -0.1])
          cylinder(r=chamfer_leg(beam_chm), h=LX-chm_leg+0.2, $fn=4);
        }
        
        translate([0, LY-beam_F_CT-beam_W-beam_fit+chamfer_leg(beam_chm), -chamfer_leg(beam_chm)])
        rotate([90, -90, 90])
        difference(){
          cube([chamfer_leg(beam_chm)+beam_F_CT, chamfer_leg(beam_chm)+beam_F_CT, LX]);
          translate([0, 0, -0.1])
          cylinder(r=chamfer_leg(beam_chm), h=LX+0.2, $fn=4);
        }
      }
      
      // cutting NEMA motor hole
      translate([-y_motor_mount_MS_CT, y_gusset_T, ply_LZ])
      hull(){
        translate([chm_leg, chm_leg, chm_leg])
        cylinder(r=chm_leg, h=LZ-2*chm_leg, $fn=4);
        
        translate([chm_leg, LY-2*y_gusset_T-chm_leg, chm_leg])
        cylinder(r=chm_leg, h=LZ-2*chm_leg, $fn=4);
        
        translate([LX-chm_leg, chm_leg, chm_leg])
        cylinder(r=chm_leg, h=LZ-2*chm_leg, $fn=4);
        
        translate([LX-chm_leg, LY-2*y_gusset_T-chm_leg, chm_leg])
        cylinder(r=chm_leg, h=LZ-2*chm_leg, $fn=4);
        
        translate([chm_leg, chm_leg, chm_leg])
        rotate([0, 90, 0])
        cylinder(r=chm_leg, h=LX-2*chm_leg, $fn=4);
        
        translate([chm_leg, LY-2*y_gusset_T-chm_leg, chm_leg])
        rotate([0, 90, 0])
        cylinder(r=chm_leg, h=LX-2*chm_leg, $fn=4);
      }
      
      // cutting the gusset
      translate([-y_motor_mount_MS_CT, -0.1, ply_LZ+chamfer_leg(y_gusset_L)])
      cube([LX, LY+0.2, LZ]);
      
      /// cutting the gusset
      translate([-y_motor_mount_MS_CT-chamfer_leg(y_gusset_L), -0.1, ply_LZ])
      cube([LX, LY+0.2, LZ]);
      
      // cutting the gusset
      translate([LX-y_motor_mount_MS_CT-chamfer_leg(y_gusset_L), -0.1, ply_LZ])
      rotate([0, -45, 0])
      cube([y_gusset_L, LY+0.2, LZ]);
      
      // NEMA motor boss hole
      translate([LX-y_motor_mount_MS_CT-0.1, LY/2, ply_LZ+interior_z_padding+nema_W/2])
      rotate([0, 90, 0])
      cylinder(d=nema_BD, h=y_motor_mount_MS_CT+0.2);
      
      // NEMA motor mounting screws
      translate([LX-y_motor_mount_MS_CT, LY/2, ply_LZ+interior_z_padding+nema_W/2])
      rotate([0, 90, 0])
      for(i=[0:nema_NS-1]){
        rotate([0, 0, i*(360/nema_NS)])
        translate([nema_MSP/2, nema_MSP/2, -0.1])
        cylinder(d=nema_MSD, h=y_motor_mount_MS_CT+0.2);
      }
      
      // rod hole
      translate([LX-y_motor_mount_MS_CT-0.1, LY/2, ply_LZ+interior_z_padding+nema_W/2+2*chamfer_leg(x_carriage_hole_chamfer)+lnut_SD/2+lnut_SPD/2+interior_z_padding+line_OD/2])
      rotate([0, 90, 0])
      cylinder(d=rod_D, h=y_motor_mount_MS_CT+0.2);
      
      // rod hole chamfer
      translate([LX, LY/2, ply_LZ+interior_z_padding+nema_W/2+2*chamfer_leg(x_carriage_hole_chamfer)+lnut_SD/2+lnut_SPD/2+interior_z_padding+line_OD/2])
      rotate([0, 90, 0])
      chamfer_cut(rod_D, y_hole_chamfer);
      
      // fastner holes for outer mount flange
      translate([chm_leg+beam_W/2, LY-beam_F_CT-0.1, -beam_W/2])
      rotate([-90, 0, 0])
      cylinder(d=beam_D+beam_F_fit, h=beam_F_CT+0.2);
      
      translate([LX-beam_W/2, LY-beam_F_CT-0.1, -beam_W/2])
      rotate([-90, 0, 0])
      cylinder(d=beam_D+beam_F_fit, h=beam_F_CT+0.2);
      
      // fastner holes for inner mount flange
      translate([chm_leg+beam_W/2, LY-2*beam_F_CT-beam_W-beam_fit-0.1, -beam_W/2])
      rotate([-90, 0, 0])
      cylinder(d=beam_D+beam_F_fit, h=beam_F_CT+0.2);
      
      translate([LX-beam_W/2-chm_leg-beam_F_CT, LY-2*beam_F_CT-beam_W-beam_fit-0.1, -beam_W/2])
      rotate([-90, 0, 0])
      cylinder(d=beam_D+beam_F_fit, h=beam_F_CT+0.2);
      
      // fastner holes for perpendicular mount flange
      translate([LX-beam_F_CT-0.1, beam_W/2, -beam_W/2])
      rotate([0, 90, 0])
      cylinder(d=beam_D+beam_F_fit, h=beam_F_CT+0.2);
    }
  }
}

