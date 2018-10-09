function y = twoBand(a,RxxH,RxxR,RxyH,RxyR)

y = [RxxR - ((a(1)*a(3)*(a(1)+a(3)) + (a(1)*a(4).^2 + a(3)*a(2).^2)*RxxH.^2) ./ ((a(1) + a(3)).^2 + (a(2) + a(4)).^2 * RxxH.^2)); ...
     RxyR - (a(2) * a(3).^2 * RxyH + a(4) * a(1).^2 * RxyH + a(2) * a(4) * (a(2) + a(4)) * RxyH.^3) ./ ((a(1) + a(3)).^2 + (a(2) + a(4)).^2 * RxyH.^2)];