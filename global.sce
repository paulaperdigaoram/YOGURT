clear; clc;

// Input
P0 = 34; // g/L
G0 = 1; // g/L
L0 = 50; // g/L
AL0 = 0; // g/L
M0 = 1; // ad
LB0 = 0; // // U/L
T0 = 20; // ºC

// (1) Mixer
exec mix.sci
i1 = [P0; G0; L0; AL0; M0; LB0; T0]
o1 = mix(i1)

// (2)Heater (steam)
exec fsolvehexs.sci
exec hexs.sci
i2 = o1
o2 = hexs(i2)

// (3)Holding tube
exec odeholding.sci
exec holding.sci
i3 = o2
o3 = holding(i3)

// (4)Cooler (water)
exec fsolvehexw.sci
exec hexw.sci
i4 = o3
o4 = hexw(i4)

// (5)Fermenter
exec odeferm.sci
exec ferm.sci
i5 = o4
o5 = ferm(i5)

// (6)Cooler (brine)
exec fsolvehexb.sci
exec hexb.sci
i6 = o5
o6 = hexb(i6)

//Output
Output = [i1,o1,o2,o3,o4,o5,o6]


   





