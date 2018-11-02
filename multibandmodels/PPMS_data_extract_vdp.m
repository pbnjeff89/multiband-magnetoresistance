% Data extraction for PPMS internal software, 2-channel van der Pauw measurements
% 2-ch vdp PPMS data files, when imported, show interleaved data, i.e.

% T(K)         R (ohm)
% 300          10 (Rch1)
% 300          14 (Rch2)
% 295          9 (Rch1)
% 295          13 (Rch2)
% 290          8 (Rch1)
% 290          12 (Rch2)
% etc...

% This code assumes the data is in column vector format, i.e.,
% size(data)=number of data points x number of variables

% Author: Tanuj Trivedi

%importData = importdata('filepath/filename');
% Or manually import data into importData through GUI (recommended)

% Get rid of extraneous data columns from the PPMS data file and dump the
% data into rData_2ch (resistance data). GUI method recommended

dataSize = size(rData_2ch);
N = dataSize(1);
temp =(1:N)';
oddInd = find(mod(temp,2)==1);
evenInd = find(mod(temp,2)==0);

rData_ch1 = [rData_2ch(oddInd,3) rData_2ch(oddInd,1)];
rData_ch2 = [rData_2ch(evenInd,3) rData_2ch(evenInd,2)];

T_ch1 = rData_ch1(:,1); % T is the temperature vector for R v T
%b_ch1 = rData_ch1(:,1); % b is the magnetic field vector for R v B
R_ch1 = rData_ch1(:,2);

T_ch2 = rData_ch2(:,1); % T is the temperature vector for R v T
%b_ch2 = rData_ch2(:,1); % b is the magnetic field vector for R v B
R_ch2 = rData_ch2(:,2);