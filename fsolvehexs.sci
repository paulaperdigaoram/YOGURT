function y = fsolvehexs(x)
    y(1) = mf * Cpf * (x(1)-Tf1) - x(2);
    y(2) = x(4) * lambda - x(2);
    y(3) = A * U * x(3) - x(2);
    y(4) = ((Tc-x(1))-(Tc-Tf1))/(log((Tc-x(1))/(Tc-Tf1))) - x(3);
endfunction
