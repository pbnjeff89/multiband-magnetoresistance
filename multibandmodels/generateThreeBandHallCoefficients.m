function a = generateThreeBandHallCoefficients(a0,H,Rxy)

options = optimset('TolFun',1e-10, 'MaxIter', 400);

f = @(a)threeBandHall(a,H,Rxy);

lowerBound = [0;-1e4;0;-1e4;0;-1e4];
upperBound = [1e4;1e4;1e4;1e4;1e4;1e4];

a = lsqnonlin(f,a0,lowerBound,upperBound,options);