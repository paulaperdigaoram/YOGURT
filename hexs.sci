function o = hexs(i)
    Tf1 = i(7)
   
    P = 300; // kPa
    Tc = 13.214*log10(P)^2 + 13.349*log10(P) + 20.113 // ºC
    lambda = -2.82854*Tc + 2.53449E+03  // kJ/kg
    
    //Tf1 = 20;  // ºC
    mf = 10000/(2*3600) // kg/s
    Cpf = 3.95; // kJ/(kg*K)
    
    U = 5; // kW/(m2*K)  Kessler 37 
    A = 1.1; // m2
   
    Tf2guess = (Tc+Tf1)/2  // ºC
    Qguess = mf*Cpf*(Tf2guess-Tf1)  // kW
    DTMLguess = ((Tc-Tf2guess)-(Tc-Tf1)) / log((Tc-Tf2guess)/(Tc-Tf1)) // ºC
    mvguess = Qguess / lambda  // kg/s
    
    xguess = [Tf2guess; Qguess; DTMLguess; mvguess];

    [x,v,info] = fsolve(xguess,fsolvehexs)
    Tf2 = x(1)
    Q = x(2)
    DTML = x(3)
    mv = x(4)
    
    scf(2); clf(2);
    plot([1 2],[Tf1,Tf2])
    plot([1 2],[Tc,Tc],'r-')
    xgrid; xtitle('HEXS', 'Q = '+ string(Q),'T, ºC')
    
    o(1) = i(1)
    o(2) = i(2)
    o(3) = i(3)
    o(4) = i(4)
    o(5) = i(5)
    o(6) = i(6)
    o(7) = Tf2
endfunction






