function y = hlnG(a,H,G)

% a(1) is the zero field conductance
% a(2) is the parameter alpha which roughly determines the number of modes

echarge = 1.60217662e-19;
h = 6.62607004e-34;

y = G - (a(1) * echarge^2 / h / pi * (log(a(2) ./ H) - ...
    psi(0.5 + a(2) ./ H)));