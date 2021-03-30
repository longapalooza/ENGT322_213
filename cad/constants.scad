//
// Dimensions
//

// Tolerances
tol1 = 0.1;         // tight fit, one side
tol2 = 0.2;         // press fit, two side (i.e. diameters)
tol3 = 0.5;
tol4 = 1;
tol5 = 2;
tol6 = 3;           // feature spacing 1
tol7 = 4;           // feature spacing 2

echo();
echo(tol1 = tol1, "tight fit, one side");
echo(tol2 = tol2, "press fit, two side (i.e. diameters)");
echo(tol3 = tol3);
echo(tol4 = tol4);
echo(tol5 = tol5);
echo(tol6 = tol6, "feature spacing 1");
echo(tol7 = tol7, "feature spacing 2");

// Chamfers
chm1 = 1;           // screw, nut, linear bearing chamfers
chm2 = 2;           // roller bearing chamfers
chm3 = 4;           // edge chamfers
chm4 = 8;           // NEMA 17 chamfers

echo();
echo(chm1 = chm1);
echo(chm2 = chm2, "screw, nut, linear bearing, roller bearing chamfers");
echo(chm3 = chm3, "edge chamfers");
echo(chm4 = chm4, "NEMA 17 chamfers");
echo();

// Fillet Radii
fill1 = 1;
fill2 = 2;
fill3 = 3;

//
// Vitamins
//

// Plywood
ply_LX = 1;                   // plywood length in x direction, WIP
ply_LY = 1;                   // plywood length in y direction, WIP
ply_LZ = 0.375*25.4;          // plywood thickness

// Beam
beam_W = 20;                  // beam width
beam_SW = 6.2;                // beam slot width
beam_SD = 6.15;               // beam slot depth

// 5/8 coupler from ZYLtech
coupler_58_L = 24.7;             // coupler length
coupler_58_OD = 18.8;            // coupler outside diameter
coupler_58_D1 = 8.0;             // coupler larger inside diameter
coupler_58_D2 = 5.1;             // coupler smaller inside diameter
coupler_58_IL = 18.1;            // coupler depth of larger inside diameter

// Fastners
//
// M3 from McMaster-Carr
fast_m3_D = 3;        // shaft diameter
fast_m3_HD = 5.5;     // head diameter
fast_m3_HH = 3;       // head height
fast_m3_HW = 2.5;     // head hex width
// M4 from McMaster-Carr
fast_m4_D = 4;        // shaft diameter
fast_m4_HD = 7;       // head diameter
fast_m4_HH = 4;       // head height
fast_m4_HW = 3;       // head hex width
// M5 from McMaster-Carr
fast_m5_D = 5;        // shaft diameter
fast_m5_HD = 8.5;     // head diameter
fast_m5_HH = 5;       // head height
fast_m5_HW = 4;       // head hex width

//
// Nuts
//
// ACME Lead Screw Brass Nut from ZYLtech
lnut_m8_ID = 8;           // inside diameter
lnut_m8_D1 = 10.2;        // diameter of lips
lnut_m8_OD = 22;          // outside diameter
lnut_m8_SPD = 16;         // mounting screw placement diameter
lnut_m8_SHD = 3.5;        // mounting screw hole diameter
lnut_m8_MSD = fast_m3_D;  // mounting screw diameter
lnut_m8_MSHD = fast_m3_HD;// moutning screw head diameter
lnut_m8_L1 = 1.5;
lnut_m8_L2 = 3.5;
lnut_m8_L3 = 10;
lnut_m8_NS = 4;           // number of mounting screws
// M5 t slot nut
tnut_m5_L = 10;           // length, along slot direction
tnut_m5_W = 10;           // width, perpendicular to beam
tnut_m5_D = fast_m5_D;    // diameter of hole
// M3 hex nut from McMaster-Carr
hnut_m3_W = 5.5;          // hex width, flat side to flat side
hnut_m3_T = 2.5;          // thickness
// M4 hex nut from McMaster-Carr
hnut_m4_W = 7;            // hex width, flat side to flat side
hnut_m4_T = 3.2;          // thickness
// M5 hex nut from McMaster-Carr
hnut_m5_W = 8;            // hex width, flat side to flat side
hnut_m5_T = 4;            // thickness
// M4 square nut from McMaster-Carr
snut_m4_W = 7;            // square width, flat side to flat side
snut_m4_T = 3.2;          // thickness
// M5 square nut from McMaster-Carr
snut_m5_W = 8;            // square width, flat side to flat side
snut_m5_T = 4;            // thickness

//
// Bearing rods
//
rod_m10 = 10;       // diameter
rod_m12 = 12;       // diamter

//
// Bearings
//
// LM10UU from ZYLtech
line_m10_ID = 10;         // inside diameter
line_m10_OD = 19;         // outside diameter
line_m10_L = 29;          // length
// LM12UU from ZYLtech
line_m12_ID = 12;         // inside diameter
line_m12_OD = 20;         // outside diameter
line_m12_L = 30;          // length
// 608 roller bearing from ZYLtech
roll_608_ID = 8;          // inside diameter
roll_608_OD = 22;         // outside diameter
roll_608_T = 7;           // thickness

//
// Motors
//
// NEMA 17 from ZYLtech
nema_17_W = 42.3;             // motor body width
nema_17_T = 48;               // motor body thickness
nema_17_BD = 22;              // boss diameter
nema_17_BT = 2;               // boss thickness
nema_17_SD = 5;               // shaft diameter
nema_17_SL = 20;              // shaft length
nema_17_SKL = 15;             // shaft key length
nema_17_SKW = 4.5;            // shaft key width, flat side to top of
                              // semi-circle

nema_17_MSD = fast_m3_D;      // mounting screw diameter
nema_17_MSHD = fast_m3_HD;    // mount screw head diameter
nema_17_MSP = 31;             // mounting screw placement width
nema_17_MSL = 5;              // mounting screw length into motor
nema_17_NS = 4;               // number of mounting screws
nema_17_chm = 6;              // corner chamfer