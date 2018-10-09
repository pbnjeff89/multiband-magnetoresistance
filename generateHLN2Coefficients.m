function a = generateHLN2Coefficients(a0,Hxx,Rxx,Hxy,Rxy)

options = optimset('TolFun',1e-10, 'MaxIter', 400);

f = @(a)hln2(a,Hxx,Rxx,Hxy,Rxy);

a = lsqnonlin(f,a0,[0;-1e9;0;-1e9;-1e9;-1e9;-1e9], ...
    [1e9;1e9;1e9;1e9;1e9;1e9;1e9], options);