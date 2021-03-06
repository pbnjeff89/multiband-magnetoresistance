function y = hln2(a,Hxx,Rxx,Hxy,Rxy)

% a(1) is the zero field conductance
% a(2) is the parameter alpha which roughly determines the number of modes

echarge = 1.60217662e-19;
h = 6.62607004e-34;

y = [Rxx - 1 ./ (a(5) + a(6) * echarge^2 / h / pi * (log(a(7) ./ Hxx) - ...
    psi(0.5 + a(7) ./ Hxx))) - ((a(1)*a(3)*(a(1)+a(3)) + ...
    (a(1) * a(4).^2 + a(3) * a(2).^2) * Hxx.^2) ./ ((a(1) + a(3)).^2 + ...
    (a(2) + a(4)).^2 * Hxx.^2)); ...
    Rxy - (a(2) * a(3).^2 * Hxy + a(4) * a(1).^2 * Hxy + ...
    a(2) * a(4) * (a(2) + a(4)) * Hxy.^3) ./ ...
    ((a(1) + a(3)).^2 + (a(2) + a(4)).^2 * Hxy.^2)];