function a = getWalPECCoefficients(a0,H,G)

dG = G - max(G);

options = optimset('TolFun',1e-10, 'MaxIter', 800);

f = @(a)walPhaseElasticCyclotron(a,H,dG);

a = lsqnonlin(f,a0,[-1e12;-10;1e-12;1e-12;0], ...
    [1e12;10;1e12;1e12;1e12], options);