function a = generateHLNG(a0,Hxx,Gxx)

options = optimset('TolFun',1e-10, 'MaxIter', 400);

f = @(a)hlnG(a,Hxx,Gxx);

a = lsqnonlin(f,a0,[1e-12;1e-12], ...
    [1e9;1e9], options);