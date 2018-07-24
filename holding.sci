function o = holding(i)
    Mini = i(5)
    T = i(7) // ºC

    D1211m = 0.05; //s 
    Zm = 10; //ºC

    xini = Mini;

    tfin = 300; dt = 0.01; // s
    t=0:dt:tfin;

    x = ode(xini,0,t,odeholding);

    M = x;
    Mfin = x($)

    
    scf(3); clf(3);
    plot2d('nl',t,M)
    
  
//    plot(t,M)
    xgrid; xtitle('HOLDING','t, s','M')
    
    o(1) = i(1)
    o(2) = i(2)
    o(3) = i(3) 
    o(4) = i(4)
    o(5) = Mfin
    o(6) = i(6)
    o(7) = i(7)
endfunction
