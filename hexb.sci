function o = hexb(i)
    
    //Datos de entrada
    Tc1 = i(7)
   
    //Parámetros
    Tf1=-3; // ºC

    mf=2*10000/(2*3600) // kg/s
    mc=10000/(2*3600) // kg/s
    
    Cpf=3.60; // kJ/(kg*K)
    Cpc=3.95;  // kJ/(kg*K)
    
    U=1.5; // kW/(m2*K)
    A=4.3; // m2
    
    //Valores supuestos a la salida
    Tf2guess = 1.1*(Tc1+Tf1)/2; 
    Tc2guess = 0.9*(Tc1+Tf1)/2; 
    Qguess = mc*Cpc*(Tc1-Tc2guess) 
    DTMLguess = ((Tc1-Tf2guess)-(Tc2guess-Tf1)) / log((Tc1-Tf2guess)/(Tc2guess-Tf1))
    
    xguess = [Tf2guess; Tc2guess; Qguess; DTMLguess];
           
    //Resolución del modelo
    [x,v,info] = fsolve(xguess,fsolvehexb)
    Tf2 = x(1) // ºC
    Tc2 = x(2) // ºC
    Q = x(3) // kW
    DTML = x(4) // ºC
    
    //Graficación
    scf(6); clf(6);
    plot([1 2],[Tc1,Tc2],'r-','thickness',3)
    plot([1 2],[Tc1,Tc2],'r.','markersize',7)
    plot([1 2],[Tf2,Tf1],'thickness',3)
    plot([1 2],[Tf2,Tf1],'b.','markersize',7)
    replot([0.95,-10,2.05,50])
    
    set(gca(), 'font_style', 6, 'font_size', 2.5);
    
    xstring(0.83,(Tc1-6.3),'Entrada Yogurt')
    xstring(1.85,(Tc2-6.3),'Salida Yogurt')
    xstring(0.82,(Tf2-5.4),'Salida Salmuera')
    xstring(1.85,(Tf1-5.2),'Entrada Salmuera')
    
    xstring(0.84,(Tc1-8.8),[string(Tc1)+'ºC'])
    xstring(1.86,(Tc2-8.8),[string(Tc2)+'ºC'])
    xstring(0.83,(Tf2-7.8),[string(Tf2)+'ºC'])
    xstring(1.86,(Tf1-7.6),[string(Tf1)+'ºC'])
    
    xstring(1.4,45,['Calor intercambiado: Q = '+string(Q) + ' kW'])
   
    xgrid; xtitle('HEXB', '','T, ºC')
    xset('font',2,2);  // modificación grosor de las líneas
    xset('wpos',[750,0]);   //fija la posición de la ventana en pantalla
    
    a = get('current_axes');
    a.axes_visible=['off','on']; //Elimina el eje x
    a.y_label.font_size = 2; //Aumento del tamaño de fuente 
    a.title.font_size = 4;
    a.y_label.font_style = 8;
    a.title.font_style = 4;
    
    //Salidas de la función
    o(1) = i(1)
    o(2) = i(2)
    o(3) = i(3)
    o(4) = i(4)
    o(5) = i(5)
    o(6) = i(6)
    o(7) = Tc2
endfunction
