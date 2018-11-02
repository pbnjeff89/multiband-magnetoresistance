function [alpha,lphi,delg,bphi] = hlnfit(flag,B,Gxx,u0)

% HLN fitting function for low-field conductivity correction to
% longitudinal MR, to account for the WAL effect
% Gxx in the units of e^2/h
% B cannot be negative, u0 = [init_alpha init_Bphi/Lphi] is the starting point
% for the least-squares curve fit to Rxx. Default values = [0.5 0.0165/100e-9]
% Bphi = hbar/(2*pi*lphi^2)
% flag decides which objective function to use: one with bphi or lphi

% Author: Tanuj Trivedi
% Date: May 2015
% Modified: April 2016

if flag == 0
    % Bphi
    if nargin < 4; u0 = [0.5 0.0165]; end
else
    % Lphi
    if nargin < 4; u0 = [0.5 100e-9]; end
end

e = 1.60217657e-19;
hbar = 1.05457173e-34;
h = hbar*2*pi;

K = 1; %Multiplication factor to enforce a scaling, or to enforce a fixed number of integral phase-coherent channels (not advised)

if B(1) == 0
    B(1) = 1e-12;
end

if flag == 0
    % --- Bphi equation ---
    f = @(u,B)u(1)*K*(psi(0.5+(u(2)./B))-log(u(2)./B));
    % Lower and upper bounds for the unknowns
    lb = [1e-2 1e-8];
    ub = [5 1e8];
else
    % --- Lphi equation ---
    f = @(u,B)u(1)*K*(psi(0.5+(hbar./(4*e*B*u(2)^2)))-log((hbar./(4*e*B*u(2)^2))));
    
    lb = [1e-2 1e-9];
    ub = [3 1e-6];
end

solver = 'lsqcurvefit';
options = optimset('Algorithm','trust-region-reflective','DerivativeCheck','off',...
    'Diagnostics','off','DiffMaxChange',0.1,'DiffMinChange',1e-8,'Display','final','FunValCheck','off',...
    'Jacobian','off','MaxFunEvals',300*length(u0),'MaxIter',400,'OutputFcn',[],...
    'PlotFcns',[],'TolFun',1e-8,'TolX',1e-8,'TypicalX',ones(size(u0)));

problem = struct('objective',f,'x0',u0,'xdata',B,'ydata',-Gxx,'lb',lb,...
    'ub',ub,'solver',solver,'options',options);

u = lsqcurvefit(problem);
alpha = u(1); 

if flag == 0
    bphi = u(2);
    lphi = sqrt(hbar/(4*e*bphi));
else
    lphi = u(2);
    bphi = hbar/(4*e*lphi^2);
end

delg = -alpha*K*(psi(0.5+bphi./B)-log(bphi./B));
end