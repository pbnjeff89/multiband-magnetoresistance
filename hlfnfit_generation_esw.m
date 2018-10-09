% HLN fitting wrapper code
% Author: Tanuj Trivedi
% Date: July 2015
% Modified: April 2016
% Modified ESW Nov 2017

% b is bxx starting from 0 - already symmetricized
% r is rxx starting from 0 -already symmetrcized

e = 1.60217657e-19;
hbar = 1.05457173e-34;
h = hbar*2*pi;

rquant = h/e^2; %Resitance quantum

bZeroInd = find(b==0);
bcutoff=1.5;
bCutoffInd = 1+floor(bcutoff/max(diff(b)));
% bcutoff is the field value till which the HLN fitting will be performed

bhln = b(bZeroInd : bZeroInd+bCutoffInd);
% b is now shortened to HLN fitting range

Gsq = (1./rxx)./(3.874E-5);
% calculates Gsq from rxx in units of e^2/h
Gsqhln = Gsq(bZeroInd : bZeroInd+bCutoffInd)-Gsq(bZeroInd);
% % Gsqhln is the nominal change in Gsq from its zero-field value,
% shortened to the HLN fitting range


% Initial guess for the two-parameter HLN-fitting (reduced-HLN equation
% considering only the phase-coherent channel)
u0 = [0.5 0.0165]; % if flag = 0, i.e., Bphi-version of the equation
% Assumes an Lphi of 100 nm => Bphi = 0.0165
%u0 = [0.5 100e-9]; % if flag = 1, i.e., Lphi-version of the equation

[alpha,lphi,delg,bphi] = hlnfit(flag,bhln,Gsqhln,u0);
% Gsqhln*rquant gives conductivity in units of e^2/h (conductance quantum)
% delg is the fit, which is negative of Gsq

plot(bhln,delg,bhln,Gsqhln,'m+')
