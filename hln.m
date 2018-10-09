function y = hln(a,H,R)

% a(1) is the zero field conductance
% a(2) is the parameter alpha which roughly determines the number of modes

G = 1 ./ R;
echarge = 1.60217662e-19;
h = 6.62607004e-34;

y = G - (a(1) + a(2) * echarge^2 / h * (log(a(3) ./ H) - psi(a(3) ./H)));