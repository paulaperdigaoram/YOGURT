function o = mix(i)
    ProtIn = i(1)
    GrasaIn = i(2)
    LactosaIn = i(3)
    
    p = 0.01 // kg leche en polvo / kg leche
    
    ProtLP = 0.384 // kg/kg leche en polvo
    GrasaLP = 0.0113  // kg/kg leche en polvo
    LactosaLP = 0.5647  // kg/kg leche en polvo
    
    ProtOut = ProtIn + p*ProtLP*1000  // g/L
    GrasaOut = GrasaIn + p*GrasaLP*1000  // g/L
    LactosaOut = LactosaIn + p*LactosaLP*1000  // g/L
    
    scf(1); clf(1);
    ejex = [1 2 3]
    ejey = [ProtIn,ProtOut ; GrasaIn,GrasaOut; LactosaIn, LactosaOut]
    bar(ejex,ejey)
    xgrid; xtitle('MIX','','')
    
    o(1) = ProtOut
    o(2) = GrasaOut
    o(3) = LactosaOut 
    o(4) = i(4)
    o(5) = i(5)
    o(6) = i(6)
    o(7) = i(7)
endfunction
