function generateThreeBandPlots(a,Hxx,Rxx,Hxy,Rxy)

[RxxModel,RxyModel] = getThreeBandModels(a);

subplot(2,1,1);
plot(Hxx,Rxx,'bo',Hxx,RxxModel,'r-')
title('Magnetoresistance')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')

subplot(2,1,2);
plot(Hxy,Rxy,'bo',Hxy,RxyModel,'r-')
title('Hall coefficient')
xlabel('Field (Oe)')
ylabel('Resistance (\Omega)')