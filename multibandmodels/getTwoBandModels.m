function [RxxModel,RxyModel] = getTwoBandModels(a,Hxx,Hxy)

RxxModel = (a(1)*a(3)*(a(1)+a(3)) + (a(1)*a(4).^2 + ...
    a(3)*a(2).^2)*Hxx.^2) ./ ((a(1) + a(3)).^2 + ...
    (a(2) + a(4)).^2 * Hxx.^2);
RxyModel = (a(2) * a(3).^2 * Hxy + a(4) * ...
    a(1).^2 * Hxy + a(2) * a(4) * (a(2) + a(4)) * ...
    Hxy.^3) ./ ((a(1) + a(3)).^2 + (a(2) + a(4)).^2 * Hxy.^2);