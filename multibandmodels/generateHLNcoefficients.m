function a = generateHLNcoefficients(a0,Hxx,Rxx,RxxHrange)

H = Hxx(RxxHrange(1):RxxHrange(2));
R = Rxx(RxxHrange(1):RxxHrange(2));

options = optimset('TolFun',1e-10, 'MaxIter', 400);

f = @(a)hln(a,H,R);

a = lsqnonlin(f,a0,[1e-12;1e-12], ...
    [1e9;1e9], options);