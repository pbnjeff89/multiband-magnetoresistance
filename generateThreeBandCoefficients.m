function a = generateThreeBandCoefficients(a0,RxxH,RxxR,RxyH,RxyR,RxxHrange,RxyHrange)

Hxx = RxxH(RxxHrange(1):RxxHrange(2));
Rxx = RxxR(RxxHrange(1):RxxHrange(2));

Hxy = RxyH(RxyHrange(1):RxyHrange(2));
Rxy = RxyR(RxyHrange(1):RxyHrange(2));

options = optimset('TolFun',1e-10, 'MaxIter', 400);

f = @(a)threeBand(a,Hxx,Rxx,Hxy,Rxy);

a = lsqnonlin(f,a0,[0;-1e4;0;-1e4;0;-1e4],[1e4;1e4;1e4;1e4;1e4;1e4], options);