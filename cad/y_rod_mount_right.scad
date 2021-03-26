include <common.scad>
use <y_rod_mount_left.scad>

y_rod_mount_right(true);

module y_rod_mount_right(print_orientation = false){
  
  if(print_orientation){
    translate([beam_W, 0, y_rod_mount_LX])
    rotate([0, 90, 0])
    body();
  } else {
    body();
  }
  
  module body(){
    translate([0, y_rod_mount_LY, 0])
    mirror([0, 1, 0])
    y_rod_mount_left();
  }
  
}