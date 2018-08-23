function o = holding(i)
    
    //Datos de entrada
    Mini = i(5)
    T = i(7) // ºC

    //Parámetros
    D1211m = 0.05; //s 
    Zm = 10; //ºC

    //Resolución del modelo
    xini = Mini;

    tfin = 300; dt = 0.01; // s
    t=0:dt:tfin;

    x = ode(xini,0,t,odeholding);

    M = x;
    Mfin = x($)

    //Graficación
    scf(3); clf(3);
    plot2d('nl',t,M,2)
    
    xgrid; xtitle('HOLDING','t, s','M')
    xset('font',2,2);  // modificación grosor de las líneas
    xset('wpos',[300,0]);   //fija la posición de la ventana en pantalla
    
    f=gcf();
    f.children.children(1).children.thickness = 2;
    
    a = get('current_axes');
    a.y_label.font_size = 2; //Aumento del tamaño de fuente 
    a.x_label.font_size = 2;
    a.title.font_size = 4;
    a.y_label.font_style = 8;
    a.x_label.font_style = 8;
    a.title.font_style = 4;
    
    //Salidas de la función
    o(1) = i(1)
    o(2) = i(2)
    o(3) = i(3) 
    o(4) = i(4)
    o(5) = Mfin
    o(6) = i(6)
    o(7) = i(7)
endfunction
