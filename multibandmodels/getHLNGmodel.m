function hlnModelG = getHLNGmodel(a, H)

echarge = 1.60217662e-19;
h = 6.62607004e-34;

hlnModelG = a(1) * echarge^2 / h / pi * ...
    (log(a(2) ./ H) - psi(0.5 + a(2) ./H));