include <constants.scad>
print_orientation = false;
//
// vitamin selection
//
// coupler selection
coupler_L = coupler_58_L;
coupler_OD = coupler_58_OD;
coupler_D1 = coupler_58_D1;
coupler_D2 = coupler_58_D2;
coupler_IL = coupler_58_IL;
// linear bearing selection
line_ID = line_m12_ID;
line_OD = line_m12_OD;
line_L = line_m12_L;
// rollering bearing selection
roll_ID = roll_608_ID;
roll_OD = roll_608_OD;
roll_T = roll_608_T;
// lead screw nut selection
lnut_ID = lnut_m8_ID;
lnut_D1 = lnut_m8_D1;
lnut_OD = lnut_m8_OD;
lnut_SPD = lnut_m8_SPD;
lnut_SHD = lnut_m8_SHD;
lnut_MSD = lnut_m8_MSD;
lnut_MSHD = lnut_m8_MSHD;
lnut_L1 = lnut_m8_L1;
lnut_L2 = lnut_m8_L2;
lnut_L3 = lnut_m8_L3;
lnut_NS = lnut_m8_NS;
// t slot nut selection
tnut_L = tnut_m5_L;
tnut_W = tnut_m5_W;
tnut_D = tnut_m5_D;
// bearing rod
rod_D = rod_m12;
// motor
nema_W = nema_17_W;
nema_T = nema_17_T;
nema_BD = nema_17_BD;
nema_BT = nema_17_BT;
nema_SD = nema_17_SD;
nema_SL = nema_17_SL;
nema_SKL = nema_17_SKL;
nema_SKW = nema_17_SKW;
nema_MSD = nema_17_MSD;
nema_MSHD = nema_17_MSHD;
nema_MSP = nema_17_MSP;
nema_MSL = nema_17_MSL;
nema_NS = nema_17_NS;
nema_chm = nema_17_chm;
// bracket fastner selection
brkt_D = fast_m5_D;
brkt_HD = fast_m5_HD;
// beam fastner selection
beam_D = fast_m5_D;

//
// Parts
//
// all parts
filament_color = "orange";
roll_fit = 0;                     // fit tolerance for roller bearing
line_fit = tol4;                  // fit tolerance for linear bearing
rod_fit = 0;                      // fit tolerance for bearing rod
lnut_fit = tol2;                  // fit tolerance for lead screw nut
lnut_S_fit = tol1;                   // fit tolerance for lead screw nut screw
                                  // (the screws that hold the lead screw
                                  // nut in place)

nema_BD_fit = tol5;               // fit tolerance for boss of nema
nema_W_fit = tol2;                // fit tolerance for nema body
nema_MSD_fit = tol2;              // fit tolerance for nema mounting screw
                                  // shaft diameter

nema_MSHD_fit = tol2;             // fit tolerance for nema mounting screw
                                  // head diameter

exterior_padding = tol6;          // space between exterior wall and
                                  // feature

interior_x_padding = tol7;        // space between features in x direction
interior_y_padding = tol7;        // space between features in y direction
interior_z_padding = tol7;        // space between features in z direction
corner_chamfer = chm3;            // chamfer size of exterior corners
beam_F_CT = 3;                    // beam fastner clamping thickness
beam_F_fit = tol2;                // fit tolerance for fastner used with
                                  // beam

beam_fit = tol2;                  // fit tolerance for beam
beam_chm = chm1;

// x axis
x_carriage_rod_spacing = 43;                  // spacing between rods
x_carriage_corner_chamfer_leg = 20;           // large chamfer cut on main
                                              // body of x carriage pieces,
                                              // both left and right

x_carriage_interior_x_padding = tol5;         // interior spacing between
                                              // features in x direction

x_carriage_hole_chamfer = chm2;               // chamfer of hole cuts
// x carriage left
x_carriage_left_LX = 2*line_L + 2*chamfer_leg(x_carriage_hole_chamfer) + 
                     x_carriage_interior_x_padding;

x_carriage_left_LY = line_OD + line_fit + 2*chamfer_leg(x_carriage_hole_chamfer) + 
                     2*exterior_padding;

x_carriage_left_LZ = 2*exterior_padding + 6*chamfer_leg(chm2) +
                     2*interior_z_padding + lnut_SHD + lnut_SPD + line_OD +
                     rod_D + x_carriage_rod_spacing;

// x carriage right
x_carriage_right_LX = x_carriage_left_LX;
x_carriage_right_LY = x_carriage_left_LY;
x_carriage_right_LZ = x_carriage_left_LZ;
x_carriage_nema_MS_CT = 8.5;                  // NEMA motor mounting screw 
                                              // counter sink clamping
                                              // thickness

// bracket
brkt_chm = chm2;      // chamfer
brkt_F_CT = 3;        // fastner clamping thickness
brkt_FO = 3;          // fastner offset
brkt_F_fit = tol2;    // fit tolerance for fastner

// y axis
y_gusset_L = 45;              // y mount gusset length
y_gusset_T = 2;               // y mount gusset thickness
y_hole_chamfer = chm2;
// y motor mount
y_motor_mount_MS_CT = 8.5;                    // NEMA motor mounting screw 
                                              // clamping thickness

y_motor_mount_LX = nema_T + y_motor_mount_MS_CT;
y_motor_mount_LY = nema_W + 2*interior_y_padding + 2*y_gusset_T;
y_motor_mount_LZ = ply_LZ + interior_y_padding + nema_W/2 +
                   2*chamfer_leg(x_carriage_hole_chamfer) + lnut_SHD/2 +
                   lnut_SPD/2 + interior_z_padding + line_OD/2 + rod_D/2 +
                   exterior_padding;
// y rod mount
y_rod_mount_LX = nema_T + roll_T + interior_x_padding;
y_rod_mount_LY = nema_W + 2*interior_y_padding + 2*y_gusset_T;
y_rod_mount_LZ = ply_LZ + interior_y_padding + nema_W/2 +
                   2*chamfer_leg(x_carriage_hole_chamfer) + lnut_SHD/2 +
                   lnut_SPD/2 + interior_z_padding + line_OD/2 + rod_D/2 +
                   exterior_padding;

// cut lengths
beam_LX = ply_LX - 2*beam_W;
beam_LX_N = 5;

beam_LY = ply_LY + y_motor_mount_LX + y_rod_mount_LY;
beam_LY_N = 2;

lead_LX_max = ply_LX - y_motor_mount_LY - x_carriage_left_LY/2 + roll_T + x_carriage_right_LY/2 - nema_SL;
lead_LX_min = lead_LX_max - 2*(coupler_L - coupler_IL);
lead_LX = (lead_LX_max + lead_LX_min)/2;
lead_LX_tol = (lead_LX_max - lead_LX_min)/2;
lead_LX_N = 1;

lead_LY_max = ply_LY + roll_T + y_motor_mount_MS_CT - nema_SL - interior_y_padding;
lead_LY_min = lead_LY_max - 2*(coupler_L - coupler_IL);
lead_LY = (lead_LY_max + lead_LY_min)/2;
lead_LY_tol = round(10*(lead_LY_max - lead_LY_min)/2)/10;
lead_LY_N = 2;

lead_LZ_max = 150;
lead_LZ_min = 150;
lead_LZ = (lead_LZ_max + lead_LZ_min)/2;
lead_LZ_tol = (lead_LZ_max - lead_LZ_min)/2;
lead_LZ_N = 1;

rod_LX_max = ply_LX - y_motor_mount_LY + x_carriage_left_LY/2 + x_carriage_right_LY/2 - exterior_padding;
rod_LX_min = rod_LX_max - x_carriage_left_LY/2 - (x_carriage_right_LY - exterior_padding)/2;
rod_LX = (rod_LX_max + rod_LX_min)/2;
rod_LX_tol = round(10*(rod_LX_max - rod_LX_min)/2)/10;
rod_LX_N = 2;

rod_LY_max = ply_LY + roll_T + interior_x_padding + y_motor_mount_MS_CT;
rod_LY_min = rod_LY_max;
rod_LY = (rod_LY_max + rod_LY_min)/2;
rod_LY_tol = (rod_LY_max - rod_LY_min)/2;
rod_LY_N = 2;

rod_LZ_max = 1;
rod_LZ_min = 1;
rod_LZ = (rod_LZ_max + rod_LZ_min)/2;
rod_LZ_tol = round(10*(rod_LZ_max - rod_LZ_min)/2)/10;
rod_LZ_N = 2;

echo(str("Plywood X = ", ply_LX));
echo(str("Plywood Y = ", ply_LY));
echo();

echo(str("Tslot Beam X = ", beam_LX, " x ", beam_LX_N));
echo(str("Tslot Beam Y = ", beam_LY, " x ", beam_LY_N));
echo(str("Tslot Total Length = ", beam_LX*beam_LX_N + beam_LY*beam_LY_N));
echo();

echo(str("Lead Screw X = ", lead_LX, "+/-", lead_LX_tol, " x ", lead_LX_N));
echo(str("Lead Screw Y = ", lead_LY, "+/-", lead_LY_tol, " x ", lead_LY_N));
echo(str("Lead Screw Z = ", lead_LZ, "+/-", lead_LZ_tol, " x ", lead_LZ_N));
echo(str("Lead Screw Total Length = ", lead_LX*lead_LX_N + lead_LY*lead_LY_N + lead_LZ*lead_LZ_N));
echo();

echo(str("Linear Rod X = ", rod_LX, "+/-", rod_LX_tol, " x ", rod_LX_N));
echo(str("Linear Rod Y = ", rod_LY, "+/-", rod_LY_tol, " x ", rod_LY_N));
echo(str("Linear Rod Z = ", rod_LZ, "+/-", rod_LZ_tol, " x ", rod_LZ_N));
echo(str("Linear Rod Total Length = ", rod_LX*rod_LX_N + rod_LY*rod_LY_N + rod_LZ*rod_LZ_N));
echo();

//
// Modules
//
// creates a hexagonal prism
// dw - either the diameter or width of the hexagon
// h - the height of the prism
// diameter - boolean of whether dw is the diameter or width
module hexagon(dw, h, diameter = false){
  if(diameter){
    for(r = [-60, 0, 60]){
      rotate([0, 0, r])
      translate([0, 0, h/2])
      cube([sqrt(3)*dw/2, dw/2, h], center = true);
    }
  } else {
    for(r = [-60, 0, 60]){
      rotate([0, 0, r])
      translate([0, 0, h/2])
      cube([dw, dw/sqrt(3), h], center = true);
    }
  }
}

// creates a solid used for cutting hole chamfers
// D - diameter of the hole for the chamfer, smaller diameter
// chm - chamfer length
module chamfer_cut(D, chm){
  translate([0, 0, -chamfer_leg(chm)-0.1])
  cylinder(d1 = D-0.2, d2 = D + 2*chamfer_leg(chm) + 0.2,
           h = chamfer_leg(chm) + 0.2);
}

// creates a NEMA motor body shaped solid
// W - width of the NEMA motor body
// T - thickness of NEMA motor body
// chm - chamfer on NEMA motor body
module nema_body(W, T, chm){
  chm_leg = chamfer_leg(chm);
  hull(){
    translate([chm_leg, chm_leg, 0])
    cylinder(r = chm_leg, h = T, $fn = 4);
    
    translate([W-chm_leg, chm_leg, 0])
    cylinder(r = chm_leg, h = T, $fn = 4);
    
    translate([W-chm_leg, W-chm_leg, 0])
    cylinder(r = chm_leg, h = T, $fn = 4);
    
    translate([chm_leg, W-chm_leg, 0])
    cylinder(r = chm_leg, h = T, $fn = 4);
  }
}

//
// Functions
//
// calculates the chamfer leg sizes, returns length of leg of chamfer triangle
// chamfer - the hypotenuse length of chamfer triangle
// angle - angle of the chamfer
// other_leg - for angles other than 45, gives the leg length of the other leg
//             of the chamfer triangle
function chamfer_leg(chamfer, angle = 45, other_leg = false) = 
    (!other_leg) ? chamfer*sin(angle) : chamfer*cos(angle);