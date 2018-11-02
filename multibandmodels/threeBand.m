function y = threeBand(a, Hxx, Rxx, Hxy, Rxy)

y = [Rxx - ((a(1) ./ (a(1)^2 + (a(2)*Hxx).^2) + a(3) ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) + a(5) ./ (a(5)^2 + (a(6)*Hxx).^2)) ./ ...
    ((a(1) ./ (a(1)^2 + (a(2)*Hxx).^2) + a(3) ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) + a(5) ./ (a(5)^2 + (a(6)*Hxx).^2)).^2 - ...
    (-a(2)*Hxx ./ (a(1)^2 + (a(2)*Hxx).^2) - a(4)*Hxx ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) - a(6)*Hxx ./ (a(5)^2 + (a(6)*Hxx).^2)) .* ...
    (a(2)*Hxx ./ (a(1)^2 + (a(2)*Hxx).^2) + a(4)*Hxx ./ ...
    (a(3)^2 + (a(4)*Hxx).^2) + a(6)*Hxx ./ (a(5)^2 + (a(6)*Hxx).^2)))); ...
    Rxy - ((a(2)*Hxy ./ (a(1)^2 + (a(2)*Hxy).^2) + a(4)*Hxy ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) + a(6)*Hxy ./ (a(5)^2 + (a(6)*Hxy).^2)) ./ ...
    ((a(1) ./ (a(1)^2 + (a(2)*Hxy).^2) + a(3) ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) + a(5) ./ (a(5)^2 + (a(6)*Hxy).^2)).^2 - ...
    (-a(2)*Hxy ./ (a(1)^2 + (a(2)*Hxy).^2) - a(4)*Hxy ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) - a(6)*Hxy ./ (a(5)^2 + (a(6)*Hxy).^2)) .* ...
    (a(2)*Hxy ./ (a(1)^2 + (a(2)*Hxy).^2) + a(4)*Hxy ./ ...
    (a(3)^2 + (a(4)*Hxy).^2) + a(6)*Hxy ./ (a(5)^2 + (a(6)*Hxy).^2))))];
    
    