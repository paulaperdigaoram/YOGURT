function o = ferm(i)
    
    //Datos de entrada
    Sini = i(3)
    Pini = i(4)
   
    //Parámetros
    Xini = 500/2500 // U/L
    
    Umax = 0.78; // h-1
    KS = 0.77; // g/L
    Y = 1.99; // U/g
    a = 0.51; // ad
    b = 0; // h-1

    //Resolución del modelo
    xini = [Xini;Sini;Pini];
    
    tfin = 6; dt = 0.01; // h
    t = 0:dt:tfin;

    x = ode(xini,0,t,odeferm);
    X = x(1,:); Xfin = X($)
    S = x(2,:); Sfin = S($)
    P = x(3,:); Pfin = P($)
    
    //Graficación
    scf(5); clf(5); 
    subplot(311); plot(t,X,'b-','thickness',2)
    xgrid; xtitle('FERM','t, h','X, U/L')
    a = get('current_axes');
    a.y_label.font_size = 2; //Aumento del tamaño de fuente 
    a.x_label.font_size = 2;
    a.title.font_size = 2;
    
    subplot(312); plot(t,S,'g-','thickness',2)
    xgrid; xtitle('','t, h','S, g/L')
    a = get('current_axes');
    a.y_label.font_size = 2; //Aumento del tamaño de fuente 
    a.x_label.font_size = 2;
    a.title.font_size = 2;
    
    subplot(313); plot(t,P,'r-','thickness',2)
    xgrid; xtitle('','t, h','P, g/L')
    a = get('current_axes');
    a.y_label.font_size = 2; //Aumento del tamaño de fuente 
    a.x_label.font_size = 2;
    a.title.font_size = 2;
    
    xset('font',2,2);  // modificación grosor de las líneas
    xset('wpos',[600,0]);   //fija la posición de la ventana en pantalla
    
    //Salidas de la función
    o(1) = i(1)
    o(2) = i(2)
    o(3) = Sfin 
    o(4) = Pfin
    o(5) = i(5)
    o(6) = Xfin
    o(7) = i(7)
endfunction
