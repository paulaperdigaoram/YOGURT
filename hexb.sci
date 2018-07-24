function o = hexb(i)
    Tc1 = i(7)
   
    Tf1=-3; // ºC

    mf=2*10000/(2*3600) // kg/s
    mc=10000/(2*3600) // kg/s
    
    Cpf=3.60; // kJ/(kg*K)
    Cpc=3.95;  // kJ/(kg*K)
    
    U=1.5; // kW/(m2*K)
    A=4.3; // m2
    
    Tf2guess = 1.1*(Tc1+Tf1)/2; 
    Tc2guess = 0.9*(Tc1+Tf1)/2; 
    Qguess = mc*Cpc*(Tc1-Tc2guess) 
    DTMLguess = ((Tc1-Tf2guess)-(Tc2guess-Tf1)) / log((Tc1-Tf2guess)/(Tc2guess-Tf1))
    
    xguess = [Tf2guess; Tc2guess; Qguess; DTMLguess];
           
    [x,v,info] = fsolve(xguess,fsolvehexb)
    Tf2 = x(1) // ºC
    Tc2 = x(2) // ºC
    Q = x(3) // kW
    DTML = x(4) // ºC
    

    
    scf(6); clf(6);
    plot([1 2],[Tc1,Tc2],'r-')
    plot([1 2],[Tf2,Tf1])
    xgrid; xtitle('HEXB (Q = '+ string(Q) + ' )','','T, ºC')
    
    

    o(1) = i(1)
    o(2) = i(2)
    o(3) = i(3)
    o(4) = i(4)
    o(5) = i(5)
    o(6) = i(6)
    o(7) = Tc2
endfunction
