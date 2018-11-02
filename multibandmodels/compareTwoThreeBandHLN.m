function [a2, a3, aHLN] = compareTwoThreeBandHLN(Hxx,Rxx,Hxy,Rxy)

a02 = [1;1;1;1];
a03 = [1;1;1;1;1;1];
a0hln = [50;50;10];

HxxRange = [1;14];
HxyRange = [1;14];

a2 = generateTwoBandCoefficients(a02,Hxx,Rxx,Hxy,Rxy,HxxRange,HxyRange);
a3 = generateThreeBandCoefficients(a03,Hxx,Rxx,Hxy,Rxy,HxxRange,HxyRange);
aHLN = generateHLNcoefficients(a0hln,Hxx,Rxx,[1;14]);

% fill in coefficients for HLN fit

[RxxModel2,RxyModel2] = getTwoBandModels(a2,Hxx,Hxy);
[RxxModel3,RxyModel3] = getThreeBandModels(a3,Hxx,Hxy);
[~,hlnModelR] = getHLNmodel(aHLN, Hxx);

% fill in plot for obtaining HLN model

subplot(2,1,1);
% modify to include HLN model
plot(Hxx,Rxx,'bo',Hxx,RxxModel2,'r-',Hxx,RxxModel3,'g-', ...
    Hxx,hlnModelR,'c-')
title('Magnetoresistance')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')
legend('Data','2-band model','3-band model','WAL model')

subplot(2,1,2);
plot(Hxy,Rxy,'bo',Hxy,RxyModel2,'r-',Hxy,RxyModel3,'g-')
title('Hall coefficient')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')
legend('Data','2-band model','3-band model')