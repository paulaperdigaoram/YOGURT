clc; clear;
// hexw.sce
// Cambiador de calor
// Fluido calefactor: agua

Tc1=100; // ºC
Tf1=15; // ºC

mf=1.5; // kg/s
mc=1; // kg/s

Cpf=4.18; // kJ/(kg*K)
Cpc=4;  // kJ/(kg*K)

U=425.5/1000; // kW/(m2*K)
A=10.8; // m2

Tf2guess = 1.1*(Tc1+Tf1)/2; 
Tc2guess = 0.9*(Tc1+Tf1)/2; 
Qguess = mc*Cpc*(Tc1-Tc2guess) 
DTMLguess = ((Tc1-Tf2guess)-(Tc2guess-Tf1)) / log((Tc1-Tf2guess)/(Tc2guess-Tf1))

xguess = [Tf2guess; Tc2guess; Qguess; DTMLguess;];

function dxdt = f(x)
    dxdt(1) = mf * Cpf * (x(1)-Tf1) - x(3);
    dxdt(2) = mc * Cpc * (Tc1-x(2)) - x(3);
    dxdt(3) = A * U * x(4) - x(3);
    dxdt(4) = ((Tc1-x(1))-(x(2)-Tf1))/(log((Tc1-x(1))/(x(2)-Tf1))) - x(4);
endfunction

[x,v,info] = fsolve(xguess,f)
Tf2 = x(1) // ºC
Tc2 = x(2) // ºC
Q = x(3) // kW
DTML = x(4) // ºC
