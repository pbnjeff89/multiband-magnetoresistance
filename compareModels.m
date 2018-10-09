function [a2,a3,aHLN,a2h,a3h] = compareModels(Hxx,Rxx,Hxy,Rxy)

a02 = [1;1;1;1];
a03 = [1;1;1;1;1;1];
a0hln = [50;50;10];

HxxRange = [1;54];
HxyRange = [1;14];

a2 = generateTwoBandCoefficients(a02,Hxx,Rxx,Hxy,Rxy,HxxRange,HxyRange);
a3 = generateThreeBandCoefficients(a03,Hxx,Rxx,Hxy,Rxy,HxxRange,HxyRange);
aHLN = generateHLNcoefficients(a0hln,Hxx,Rxx,[1;14]);
a2h = generateTwoBandHallCoefficients(a02,Hxy,Rxy);
a3h = generateThreeBandHallCoefficients(a03,Hxy,Rxy);

% fill in coefficients for HLN fit

[RxxModel2,RxyModel2] = getTwoBandModels(a2,Hxx,Hxy);
[RxxModel3,RxyModel3] = getThreeBandModels(a3,Hxx,Hxy);
[~,hlnModelR] = getHLNmodel(aHLN, Hxx);
[RxxModel2h,RxyModel2h] = getTwoBandModels(a2h,Hxx,Hxy);
[RxxModel3h,RxyModel3h] = getThreeBandModels(a3h,Hxx,Hxy);

% fill in plot for obtaining HLN model

subplot(2,1,1);
% modify to include HLN model
plot(Hxx,Rxx,'bo',Hxx,RxxModel2,'r-',Hxx,RxxModel3,'g-', ...
    Hxx,hlnModelR,'c-',Hxx,RxxModel2h,'k-',Hxx,RxxModel3h,'y-')
ylim([55 100])
title('Magnetoresistance')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')
legend('Data','2-band model (fit to both Rxx and Rxy)',...
    '3-band model (fit to both Rxx and Rxy)','WAL model',...
    '2-band model (fit on Rxy only)', ...
    '3-band model (fit on Rxy only)')

subplot(2,1,2);
plot(Hxy,Rxy,'bo',Hxy,RxyModel2,'r-',Hxy,RxyModel3,'g-',...
    Hxy,RxyModel2h,'k-',Hxy,RxyModel3h,'y-')
title('Hall coefficient')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')
legend('Data','2-band model (fit to both Rxx and Rxy)',...
    '3-band model (fit to both Rxx and Rxy)',...
    '2-band model (fit on Rxy only)', ...
    '3-band model (fit on Rxy only)')