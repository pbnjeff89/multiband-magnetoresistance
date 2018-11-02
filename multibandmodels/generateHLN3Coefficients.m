function a = generateHLN3Coefficients(a0,Hxx,Rxx,Hxy,Rxy,RxxHrange,RxyHrange)

Hxx = Hxx(RxxHrange(1):RxxHrange(2));
Rxx = Rxx(RxxHrange(1):RxxHrange(2));

Hxy = Hxy(RxyHrange(1):RxyHrange(2));
Rxy = Rxy(RxyHrange(1):RxyHrange(2));

options = optimset('TolFun',1e-10, 'MaxIter', 400);

f = @(a)hln3(a,Hxx,Rxx,Hxy,Rxy);

a = lsqnonlin(f,a0,[0;-1e9;0;-1e9;0;-1e9;-1e9;-1e9;-1e9], ...
    [1e9;1e9;1e9;1e9;1e9;1e9;1e9;1e9;1e9], options);