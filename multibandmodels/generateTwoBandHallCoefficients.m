function a = generateTwoBandHallCoefficients(a0,H,Rxy)

options = optimset('TolFun',1e-10, 'MaxIter', 400);

f = @(a)twoBandHall(a,H,Rxy);

a = lsqnonlin(f,a0,[0;-1e4;0;-1e4],[1e4;1e4;1e4;1e4], options);