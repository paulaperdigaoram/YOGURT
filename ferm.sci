function o = ferm(i)
    Xini = 500/2500
    Sini = i(3)
    Pini = i(4)
  
    Umax = 0.78; // h-1
    KS = 0.77; // g/L
    Y = 1.99; // U/g
    a = 0.51; // ad
    b = 0; // h-1

    xini = [Xini;Sini;Pini];
    
    tfin = 6; dt = 0.01; // h
    t = 0:dt:tfin;

    x = ode(xini,0,t,odeferm);
    X = x(1,:); Xfin = X($)
    S = x(2,:); Sfin = S($)
    P = x(3,:); Pfin = P($)
    
    scf(5); clf(5);
    
    subplot(311); plot(t,X,'b-')
    xgrid; xtitle('FERM','t','X')
    
    subplot(312); plot(t,S,'g-')
    xgrid; xtitle('','t','S')
    
    subplot(313); plot(t,P,'r-')
    xgrid; xtitle('','t','P')

    o(1) = i(1)
    o(2) = i(2)
    o(3) = Sfin 
    o(4) = Pfin
    o(5) = i(5)
    o(6) = Xfin
    o(7) = i(7)
endfunction
