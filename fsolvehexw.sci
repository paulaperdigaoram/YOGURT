function y = fsolvehexw(x)
    y(1) = mf * Cpf * (x(1)-Tf1) - x(3);
    y(2) = mc * Cpc * (Tc1-x(2)) - x(3);
    y(3) = A * U * x(4) - x(3);
    y(4) = ((Tc1-x(1))-(x(2)-Tf1))/(log((Tc1-x(1))/(x(2)-Tf1))) - x(4);
endfunction