include <common.scad>

bracket(true);

module bracket(print_orientation = false){
  $fn = 64;
  angle = atan2(beam_W - brkt_chm, beam_W + brkt_FO - brkt_chm);
  
  color(filament_color)
  if(print_orientation){
    translate([0, 0, beam_W*sin(90 - angle) + brkt_chm*cos(90 - angle)])
    rotate([-90, angle, 0])
    body();
  } else {
    body();
  }

  module body(){
    union(){
      difference(){
        linear_extrude(height = beam_W){
         polygon([[0, 0],
                  [beam_W + brkt_FO, 0],
                  [beam_W + brkt_FO, brkt_chm],
                  [brkt_chm, beam_W],
                  [0, beam_W]]);
        }
        
        translate([-0.1, beam_W/2, beam_W/2])
        rotate([0, 90, 0])
        cylinder(d = brkt_D + brkt_F_fit, h = beam_W + brkt_FO);

        translate([beam_W/2 + brkt_FO, -0.1, beam_W/2])
        rotate([-90, 0, 0])
        cylinder(d = brkt_D + brkt_F_fit, h = beam_W+brkt_FO);
        
        translate([brkt_F_CT, brkt_F_CT, brkt_F_CT])
        hull(){
          translate([chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm)])
          cylinder(r = chamfer_leg(brkt_chm),
                   h = beam_W - 2*brkt_F_CT - 2*chamfer_leg(brkt_chm),
                   $fn = 4);

          translate([chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm)])
          rotate([0, 90, 0])
          cylinder(r = chamfer_leg(brkt_chm), h = beam_W + brkt_FO, $fn = 4);

          translate([chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm)])
          rotate([-90, 0, 0])
          cylinder(r = chamfer_leg(brkt_chm), h = beam_W + brkt_FO, $fn = 4);

          translate([chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm),
                     beam_W - 2*brkt_F_CT - chamfer_leg(brkt_chm)])
          rotate([0, 90, 0])
          cylinder(r = chamfer_leg(brkt_chm), h = beam_W + brkt_FO, $fn = 4);

          translate([chamfer_leg(brkt_chm),
                     chamfer_leg(brkt_chm),
                     beam_W - 2*brkt_F_CT - chamfer_leg(brkt_chm)])
          rotate([-90, 0, 0])
          cylinder(r = chamfer_leg(brkt_chm),
                   h=beam_W + brkt_FO, $fn = 4);
        }
      }

      translate([0, beam_W, beam_W/2 - beam_SW/2])
      rotate([90, 0, -90])
      slot_nibs(beam_W);

      translate([0, 0, beam_W/2 - beam_SW/2])
      rotate([90, 0, 0])
      slot_nibs(beam_W, brkt_FO);
    }

    module slot_nibs(L, OF = 0){
      difference(){
        cube([L + OF, beam_SW, beam_SD]);
        translate([(L - tnut_L)/2 + OF, -0.1, -0.1])
        cube([tnut_L, beam_SW + 0.2, beam_SD + 0.2]);
      }
    }
  }
}