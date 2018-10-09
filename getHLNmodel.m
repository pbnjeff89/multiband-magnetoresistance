function [hlnModelG, hlnModelR] = getHLNmodel(a, H)

echarge = 1.60217662e-19;
h = 6.62607004e-34;

hlnModelG = a(1) + a(2) * echarge^2 / h * (log(a(3) ./ H) - psi(a(3) ./H));

hlnModelR = 1 ./ hlnModelG;