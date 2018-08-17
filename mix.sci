function o = mix(i)
    
    //Datos de entrada
    ProtIn = i(1)
    GrasaIn = i(2)
    LactosaIn = i(3)
    
    //Parámetros
    p = 0.01 // kg leche en polvo / kg leche
    
    ProtLP = 0.384 // kg/kg leche en polvo
    GrasaLP = 0.0113  // kg/kg leche en polvo
    LactosaLP = 0.5647  // kg/kg leche en polvo
    
    //Resolución del modelo
    ProtOut = ProtIn + p*ProtLP*1000  // g/L
    GrasaOut = GrasaIn + p*GrasaLP*1000  // g/L
    LactosaOut = LactosaIn + p*LactosaLP*1000  // g/L
    
    //Graficación
    scf(1); clf(1);
    ejex = [1 2 3]
    ejey = [ProtIn, ProtOut ; GrasaIn, GrasaOut; LactosaIn, LactosaOut]
    bar(ejex, ejey, 0.7)
    xgrid; xtitle('MIX','PROTEÍNA                                     GRASA                                    LACTOSA    ','CONCENTRACIÓN (g/L)');
    legend("Entrada","Salida",2);
    
    a = get("current_axes");
    a.axes_visible=["off","on"]; //Elimina el eje x
    
    a.y_label.font_size = 2; //Aumento del tamaño de fuente 
    a.x_label.font_size = 2;
    a.title.font_size = 2;
    
    xset("font",1,2);  // modificación del grosor de las líneas
    xset("wpos",[0,0]);   //fija la posición de la ventana en pantalla
    
    //Salidas de la función
    o(1) = ProtOut
    o(2) = GrasaOut
    o(3) = LactosaOut 
    o(4) = i(4)
    o(5) = i(5)
    o(6) = i(6)
    o(7) = i(7)
endfunction
