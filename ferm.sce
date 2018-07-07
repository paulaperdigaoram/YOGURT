clc; clear;
// ferm.sce
// Fermentador discontinuo
// Futuro: modelar producto (ácido láctico)
Umax = 0.78; // h-1
KS = 0.77; // g/L
Y = 1.99; // U/g
a = 0.51; // ad
b = 0; // h-1



Xini = 500/2500; // U/L (0.02%)
// Chr. Hansen FD-DVS YoFlex Mild 1.0
// Xfin = 50000/2500 = 20

Sini = 50; // g Lactosa / L
//Sfin = 40; // g Lactosa /L

Pini = 0; // g Ácido láctico/ L
//Pfin = 10; // g Ácido láctico/ L



xini = [Xini;Sini;Pini];

tfin = 6; dt = 0.01; // h
t = 0:dt:tfin;

function dxdt = f(t,x)
    U = Umax*x(2)/(KS+x(2))
    rX = U*x(1)
    rS = -rX/Y
    rP = (a*U+b)*x(1)
    dxdt(1) = rX
    dxdt(2) = rS
    dxdt(3) = rP
endfunction

x = ode(xini,0,t,f);
X = x(1,:); Xfin = X($)
S = x(2,:); Sfin = S($)
P = x(3,:); Pfin = P($)

scf(1); clf(1);

subplot(311); plot(t,X,'b-')
xgrid; xtitle('FERM-2a','t','X')

subplot(312); plot(t,S,'g-')
xgrid; xtitle('FERM-2a','t','S')

subplot(313); plot(t,P,'r-')
xgrid; xtitle('FERM-2a','t','P')

Xfin
Sfin
Pfin
