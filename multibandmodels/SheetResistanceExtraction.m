% Converts 2 measured orientations of RxxA and RxxB to sheet resistance
% Uses vdP equation for sample with 4 contacts
% Import RxxA and RxxB as variables. Should be same size arrays. 

err = 1;
z= 2*log(2)./(pi*(RxxA + RxxB));

while(err > 0.000005)
    yA = 1./exp(pi*z.*RxxA);
    yB = 1./exp(pi*z.*RxxB);
    y = yA + yB;
    zi = z - ((1-y)/pi)./((RxxA./exp(pi*z.*RxxA))+RxxB./exp(pi*z.*RxxB));
    err = (zi-z)./z;
    z = zi;
end

Rsheet = 1./z;



    