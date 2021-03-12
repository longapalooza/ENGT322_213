include <common.scad>
use <y_motor_mount_right.scad>

y_motor_mount_left(true);

module y_motor_mount_left(print_orientation=false){
  
  if(print_orientation){
    translate([beam_W, 0, y_motor_mount_LX])
    rotate([0, 90, 0])
    body();
  } else {
    body();
  }
  
  module body(){
    translate([0, y_motor_mount_LY, 0])
    mirror([0, 1, 0])
    y_motor_mount_right();
  }
  
}