function o = hexw(i)
    
    //Datos de entrada
    Tc1 = i(7)
   
    //Parámetros
    Tf1=15; // ºC
    
    mf=2*10000/(2*3600) // kg/s
    mc=10000/(2*3600) // kg/s
    
    Cpf=4.18; // kJ/(kg*K)
    Cpc=3.95;  // kJ/(kg*K)
    
    U=1.5; // kW/(m2*K)
    A=4.5; // m2
    
    //Valores supuestos a la salida
    Tf2guess = 1.1*(Tc1+Tf1)/2; 
    Tc2guess = 0.9*(Tc1+Tf1)/2; 
    Qguess = mc*Cpc*(Tc1-Tc2guess) 
    DTMLguess = ((Tc1-Tf2guess)-(Tc2guess-Tf1)) / log((Tc1-Tf2guess)/(Tc2guess-Tf1))
    
    xguess = [Tf2guess; Tc2guess; Qguess; DTMLguess;];
    
    //Resolución del modelo
    [x,v,info] = fsolve(xguess,fsolvehexw)
    Tf2 = x(1) // ºC
    Tc2 = x(2) // ºC
    Q = x(3) // kW
    DTML = x(4) // ºC
    
    //Graficación
    scf(4); clf(4);
    plot([1 2],[Tc1,Tc2],'r-','thickness',3)
    plot([1 2],[Tc1,Tc2],'r.','markersize',7)
    plot([1 2],[Tf2,Tf1],'thickness',3)
    plot([1 2],[Tf2,Tf1],'b.','markersize',7)
    replot([0.95,0,2.05,100])
    
    xstring(0.85,(Tc1-8),'Entrada Leche')
    xstring(1.85,(Tc2-8),'Salida Leche')
    xstring(0.85,(Tf2-8.2),'Salida Agua')
    xstring(1.9,(Tf1-6),'Entrada Agua')
    
    xstring(0.86,(Tc1-12),[string(Tc1)+'ºC'])
    xstring(1.86,(Tc2-12),[string(Tc2)+'ºC'])
    xstring(0.86,(Tf2-13),[string(Tf2)+'ºC'])
    xstring(1.91,(Tf1-11),[string(Tf1)+'ºC'])
    
    xstring(1.5,82,['Calor intercambiado: Q = '+string(Q) + ' kW'])
   
    xgrid; xtitle('HEXW', '','T, ºC')
    xset('font',2,2);  // modificación grosor de las líneas
    xset('wpos',[450,0]);   //fija la posición de la ventana en pantalla
    
    a = get('current_axes');
    a.axes_visible=['off','on']; //Elimina el eje x
    a.y_label.font_size = 2; //Aumento del tamaño de fuente 
    a.x_label.font_size = 2;
    a.title.font_size = 2;
    
    //Salidas de la función
    o(1) = i(1)
    o(2) = i(2)
    o(3) = i(3)
    o(4) = i(4)
    o(5) = i(5)
    o(6) = i(6)
    o(7) = Tc2
endfunction
