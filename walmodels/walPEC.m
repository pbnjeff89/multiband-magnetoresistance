function y = walPEC(a,H,G)

echarge = 1.60217662e-19;
h = 6.62607004e-34;

y = G - (a(1) + a(2) * echarge ^ 2 / (2 * pi * h) * (log(a(3) ./ H) - ...
    psi(0.5 + a(3) ./ H)) + 2 * a(2) * echarge ^ 2 / (2 * pi * h) * ...
    (log(a(4) ./ H) - psi(0.5 + a(4) ./ H)) - a(5) .* H .^ 2);