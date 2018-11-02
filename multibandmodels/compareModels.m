function [a2,a3,aHLN,a2h,a3h] = compareModels(Hxx,Rxx,Hxy,Rxy)

a02 = [180;0;140;0];
a03 = [150;0;140;0;4700;0];
a0hln = [0.1;0.5;1e7];
a0hln2 = [180;0;140;0;1;1;3e6];
a0hln3 = [140;0.000298;160;-0.000258;3000;-6.773291;1;1;3e6];

HxxRange = [1;53];
HxyRange = [1;14];

a2 = generateTwoBandCoefficients(a02,Hxx,Rxx,Hxy,Rxy,[1;45],HxyRange);
a3 = generateThreeBandCoefficients(a03,Hxx,Rxx,Hxy,Rxy,HxxRange,HxyRange);
aHLN = generateHLNcoefficients(a0hln,Hxx,Rxx,[1;14]);
a2h = generateHLN2Coefficients(a0hln2,Hxx,Rxx,Hxy,Rxy,[1;45],HxyRange);
a3h = generateHLN3Coefficients(a0hln3,Hxx,Rxx,Hxy,Rxy,HxxRange,HxyRange);

% Print out coefficients

fprintf('Rho: Resistivity; Hall: Hall Coefficient\n\n')
% Two-band model
fprintf('Two-Band Model\n\n')
fprintf('Rho 1: %.3f; Rho 2: %.3f\n', ...
    a2(1),a2(3))
fprintf('Hall 1:%.6f; Hall 2: %.6f\n\n', ...
    a2(2),a2(4))

% Three-band model
fprintf('Three-Band Model\n\n')
fprintf('Rho 1: %.3f; Rho 2: %.3f; Rho 3: %.3f\n', ...
    a3(1),a3(3),a3(5))
fprintf('Hall 1: %.6f; Hall 2: %.6f; Hall 3: %.6f\n\n', ...
    a3(2),a3(4),a3(6))

% HLN model
fprintf('HLN Model\n\n')
fprintf('G(0): %.3f; alpha: %.3f; H_phi: %.3f\n\n', ...
    aHLN(1),aHLN(2),aHLN(3))

% Two-band + HLN model
fprintf('Two-Band + HLN Model\n\n')
fprintf('Rho 1: %.3f; Rho 2: %.3f\n', ...
    a2h(1),a2h(3))
fprintf('Hall 1: %.6f; Hall 2: %.6f\n', ...
    a2h(2),a2h(4))
fprintf('G(0): %.3f; alpha: %.3f; H_phi: %.3f\n\n', ...
    a2h(5),a2h(6),a2h(7))

% Three-Band + HLN model
fprintf('Three-Band + HLN Model\n\n')
fprintf('Rho 1: %.3f; Rho 3: %.3f; Rho 3: %.3f\n', ...
    a3h(1),a3h(3),a3h(5))
fprintf('Hall 1: %.6f; Hall 2: %.6f; Hall 3: %.6f\n', ...
    a3h(2),a3h(4),a3h(6))
fprintf('G(0): %.3f; alpha: %.3f; H_phi: %.3f\n\n', ...
    a3h(7),a3h(8),a3h(9))

% fill in coefficients for HLN fit

[RxxModel2,RxyModel2] = getTwoBandModels(a2,Hxx,Hxy);
[RxxModel3,RxyModel3] = getThreeBandModels(a3,Hxx,Hxy);
[~,hlnModelR] = getHLNmodel(aHLN, Hxx);
[RxxModel2h,RxyModel2h] = getHLN2Models(a2h,Hxx,Hxy);
[RxxModel3h,RxyModel3h] = getHLN3Models(a3h,Hxx,Hxy);

% fill in plot for obtaining HLN model

subplot(2,1,1);
% modify to include HLN model
plot(Hxx,Rxx,'bo',Hxx,RxxModel2,'r-',Hxx,RxxModel3,'g-', ...
    Hxx,hlnModelR,'c-',Hxx,RxxModel2h,'k-',...
    Hxx,RxxModel3h,'y-')
%ylim([50;100])
title('Magnetoresistance')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')
legend('Data','2-band model (no WAL)',...
    '3-band model (no WAL)',...
    'WAL model',...
    '2-band model (with WAL correction)',...
    '3-band model (with WAL correction)')

subplot(2,1,2);
plot(Hxy,Rxy,'bo',Hxy,RxyModel2,'r-',Hxy,RxyModel3,'g-',...
    Hxy,RxyModel2h,'k-',Hxy,RxyModel3h,'y-')
title('Hall coefficient')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')
legend('Data','2-band model (no WAL)',...
    '3-band model (no WAL)',...
    '2-band model (with WAL correction)',...
    '3-band model (with WAL correction)')