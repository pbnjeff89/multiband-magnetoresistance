function [RxxModel3h,RxyModel3h] = getHLN3Models(a,Hxx,Hxy)

echarge = 1.60217662e-19;
h = 6.62607004e-34;

RxxModel3h = 1 ./ (a(7) + a(8) * echarge^2 / h / pi * (log(a(9) ./ Hxx) - ...
    psi(0.5 + a(9) ./ Hxx))) + ...
    (a(1) ./ (a(1)^2 + (a(2)*Hxx).^2) + a(3) ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) + a(5) ./ (a(5)^2 + (a(6)*Hxx).^2)) ./ ...
    ((a(1) ./ (a(1)^2 + (a(2)*Hxx).^2) + a(3) ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) + a(5) ./ (a(5)^2 + (a(6)*Hxx).^2)).^2 - ...
    (-a(2)*Hxx ./ (a(1)^2 + (a(2)*Hxx).^2) - a(4)*Hxx ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) - a(6)*Hxx ./ (a(5)^2 + (a(6)*Hxx).^2)) .* ...
    (a(2)*Hxx ./ (a(1)^2 + (a(2)*Hxx).^2) + a(4)*Hxx ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) + a(6)*Hxx ./ (a(5)^2 + (a(6)*Hxx).^2)));

RxyModel3h = (a(2)*Hxy ./ (a(1)^2 + (a(2)*Hxy).^2) + a(4)*Hxy ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) + a(6)*Hxy ./ (a(5)^2 + (a(6)*Hxy).^2)) ./ ...
    ((a(1) ./ (a(1)^2 + (a(2)*Hxy).^2) + a(3) ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) + a(5) ./ (a(5)^2 + (a(6)*Hxy).^2)).^2 - ...
    (-a(2)*Hxy ./ (a(1)^2 + (a(2)*Hxy).^2) - a(4)*Hxy ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) - a(6)*Hxy ./ (a(5)^2 + (a(6)*Hxy).^2)) .* ...
    (a(2)*Hxy ./ (a(1)^2 + (a(2)*Hxy).^2) + a(4)*Hxy ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) + a(6)*Hxy ./ (a(5)^2 + (a(6)*Hxy).^2)));