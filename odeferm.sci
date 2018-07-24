function dxdt = odeferm(t,x)
    U = Umax*x(2)/(KS+x(2))
    rX = U*x(1)
    rS = -rX/Y
    rP = (a*U+b)*x(1)
    
    dxdt(1) = rX
    dxdt(2) = rS
    dxdt(3) = rP
endfunction
