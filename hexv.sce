clc; clear;
// hexv.sce
// Cambiador de calor
// Fluido calefactor: vapor de agua

P = 500; // kPa

// https://www.engineeringtoolbox.com/saturated-steam-properties-d_101.html


Tc = 13.214*log10(P)^2 + 13.349*log10(P) + 20.113 // ºC

Tf1 = 15;  // ºC
mf = 0.4; // kg/s

Cpf = 5; // kJ/(kg*K)

lambda = -2.82854*Tc + 2.53449E+03  // ºC

U = 282.1/1000; // kW/(m2*K)
A = 4.566; // m2

Tf2guess = (Tc+Tf1)/2 
Qguess = mf*Cpf*(Tf2guess-Tf1) 
DTMLguess = ((Tc-Tf2guess)-(Tc-Tf1)) / log((Tc-Tf2guess)/(Tc-Tf1))
mvguess = Qguess / lambda

xguess = [Tf2guess; Qguess; DTMLguess; mvguess];


function dxdt = f(x)
    dxdt(1) = mf * Cpf * (x(1)-Tf1) - x(2);
    dxdt(2) = x(4) * lambda - x(2);
    dxdt(3) = A * U * x(3) - x(2);
    dxdt(4) = ((Tc-x(1))-(Tc-Tf1))/(log((Tc-x(1))/(Tc-Tf1))) - x(3);
endfunction

[x,v,info] = fsolve(xguess,f)
Tf2 = x(1)
Q = x(2)
DTML = x(3)
mv = x(4)
