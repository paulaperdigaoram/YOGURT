// TERM-1.mmd
// Tratamiento discontinuo isotermo.

clear; clc;

// PARAMETERS

// Constants
T = 120; // ºC


// Microorganismo B. stearothermophillus

D1211m = 175; // s
Zm = 8; // ºC


// Vitamina: Vitamina B1

D1211v = 400; // s 
Zv = 25; // ºC


Mini = 1E5; // UFC/mL
Vini = 1; // mg/L


tfin = 1000; dt = 0.01;
t=0:dt:tfin;



function dxdt = f(t,x)

	
	Dm = D1211m*10^((121.1-T)/Zm); // s
	km = log(10)/Dm; // s-1
	
	Dv = D1211v*10^((121.1-T)/Zv); // s
	kv = log(10)/Dv; // s-1

	rM = -km*x(1);
	rV = -kv*x(2);
	
	dxdt(1) = rM;
	dxdt(2) = rV;

endfunction

xini = [Mini;Vini];
x = ode(xini,0,t,f);

Mfin = x(1,$);
Vfin = x(2,$);


OrdFin = log10(Mini/Mfin);
FracFin = Vfin/Vini;

Mfin($)
Vfin($)
OrdFin($)
FracFin($)


