// Mexclador

clc; clear;

//Corriente 1  -- Leche desnatada

m_C1 = 1; //kg/s

CProteinas_C1 = 3.4;  // %
CLipidos_C1 = 0.1;  // %
CHidratosCarbono_C1 = 5;  // %
CAgua_C1 = 91.5;  // %

Proteinas_C1 = CProteinas_C1/100 * m_C1;  // kg/s
Lipidos_C1 = CLipidos_C1/100 * m_C1;  // kg/s
HidratosCarbono_C1 = CHidratosCarbono_C1/100 * m_C1;  // kg/s
Agua_C1 = CAgua_C1/100 * m_C1;  // kg/s


//Corriente 2 -- Leche desnatada en polvo

m_C2 = 0.03; //kg/s

CProteinas_C2 = 38.4;  // %
CLipidos_C2 = 1.13;  // %
CHidratosCarbono_C2 = 56.47;  // %
CAgua_C2 = 4;  // %

Proteinas_C2 = CProteinas_C2/100 * m_C2;  // kg/s
Lipidos_C2 = CLipidos_C2/100 * m_C2;  // kg/s
HidratosCarbono_C2 = CHidratosCarbono_C2/100 * m_C2;  // kg/s
Agua_C2 = CAgua_C2/100 * m_C2;  // kg/s


//Corriente 3 -- Leche a fermentar

m_C3 = m_C1 + m_C2 ; //kg/s

Proteinas_C3 = Proteinas_C1 + Proteinas_C2;  // kg/s
Lipidos_C3 = Lipidos_C1 + Lipidos_C2;  // kg/s
HidratosCarbono_C3 = HidratosCarbono_C1 + HidratosCarbono_C2;  // kg/s
Agua_C3 = Agua_C1 + Agua_C2;  // kg/s

CProteinas_C3 = Proteinas_C3/m_C3*100;  // %
CLipidos_C3 = Lipidos_C3/m_C3*100 ;  // %
CHidratosCarbono_C3 = HidratosCarbono_C3/m_C3*100;  // %
CAgua_C3 = Agua_C3/m_C3*100;  // %









