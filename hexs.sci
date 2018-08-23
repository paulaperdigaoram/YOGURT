function o = hexs(i)
    
    //Datos de entrada
    Tf1 = i(7)
   
    // Parámetros
    P = 300; // kPa
    Tc = 13.214*log10(P)^2 + 13.349*log10(P) + 20.113 // ºC
    lambda = -2.82854*Tc + 2.53449E+03  // kJ/kg
    
    mf = 10000/(2*3600) // kg/s
    Cpf = 3.95; // kJ/(kg*K)
    
    U = 5; // kW/(m2*K)
    A = 1.1; // m2
   
    //Valores supuestos a la salida
    Tf2guess = (Tc+Tf1)/2  // ºC
    Qguess = mf*Cpf*(Tf2guess-Tf1)  // kW
    DTMLguess = ((Tc-Tf2guess)-(Tc-Tf1)) / log((Tc-Tf2guess)/(Tc-Tf1)) // ºC
    mvguess = Qguess / lambda  // kg/s
    
    xguess = [Tf2guess; Qguess; DTMLguess; mvguess];
    
    //Resolución del modelo
    [x,v,info] = fsolve(xguess,fsolvehexs)
    Tf2 = x(1)
    Q = x(2)
    DTML = x(3)
    mv = x(4)
    
    //Graficación
    scf(2); clf(2);
    plot([1 2],[Tf1,Tf2],'thickness',3)
    plot([1 2],[Tf1,Tf2],'b.','markersize',7)
    plot([1 2],[Tc,Tc],'r-','thickness',3)
    plot([1 2],[Tc,Tc],'r.','markersize',7)
    replot([0.95,10,2.05,140])
    
    set(gca(), 'font_style', 6, 'font_size', 2.5);
    
    xstring(0.9,(Tc-10),'Salida Vapor')
    xstring(1.9,(Tc-10),'Entrada Vapor')
    xstring(0.9,(Tf1-10),'Entrada Leche')
    xstring(1.95,(Tf2-9),'Salida Leche')
    
    xstring(0.9,(Tc-15.4),[string(Tc)+'ºC'])
    xstring(1.91,(Tc-15.4),[string(Tc)+'ºC'])
    xstring(0.91,(Tf1-15.4),[string(Tf1)+'ºC'])
    xstring(1.96,(Tf2-14.4),[string(Tf2)+'ºC'])
    
    xstring(1.4,10,['Calor intercambiado: Q = '+string(Q) + ' kW'])
    xstring(1.32,2,['Caudal de vapor requerido: mv = '+string(mv) + ' kg/s'])
    
    xgrid; xtitle('HEXS', '','T, ºC')
    xset('font',2,2);  // modificación grosor de las líneas
    xset('wpos',[150,0]);   //fija la posición de la ventana en pantalla
    
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
    o(7) = Tf2
endfunction






