function plotIDResults(infile)

% Matlab program to plot inverse dynamics results from walking for the
% pelvis and both legs to verify that:
% 1) The pelvis residual forces and moments oscillate about zero, and
% 2) The right and left leg inverse dynamics moments are roughly the same
% shapes and amplitudes.
%
% Inputs: infile - Name of OpenSim inverse dynamics .sto file (e.g.,
%                  <basename>.sto).
%
% Outputs: None.

close all

% Read in inverse dynamics data from .sto file
fprintf('Reading in inverse dynamics data from file %s . . .\n', infile)
data = importdata(infile);

% Extract inverse dynamics data
timeData = data.data(:,1);
idData = data.data(:,2:end);

% Plot pelvis moments and force
figure
subplot(1,2,1), plot(timeData,idData(:,1),'k-',timeData,idData(:,2),'r-',timeData,idData(:,3),'b-')
xlabel('time')
ylabel('pelvis moments')
subplot(1,2,2), plot(timeData,idData(:,4),'k-',timeData,idData(:,5),'r-',timeData,idData(:,6),'b-')
xlabel('time')
ylabel('pelvis force')

% Plot hip moments from both sides
figure
subplot(2,3,1), plot(timeData,idData(:,7),'k-',timeData,idData(:,10),'r-')
xlabel('time')
ylabel('hip flexion')
subplot(2,3,2), plot(timeData,idData(:,8),'k-',timeData,idData(:,11),'r-')
xlabel('time')
ylabel('hip adduction')
subplot(2,3,3), plot(timeData,idData(:,9),'k-',timeData,idData(:,12),'r-')
xlabel('time')
ylabel('hip rotation')
subplot(2,3,4), plot(timeData,idData(:,16),'k-',timeData,idData(:,19),'r-')
xlabel('time')
ylabel('knee moment')
subplot(2,3,5), plot(timeData,idData(:,28),'k-',timeData,idData(:,29),'r-')
xlabel('time')
ylabel('ankle moment')
subplot(2,3,6), plot(timeData,idData(:,32),'k-',timeData,idData(:,33),'r-')
xlabel('time')
ylabel('subtalar moments')

end
