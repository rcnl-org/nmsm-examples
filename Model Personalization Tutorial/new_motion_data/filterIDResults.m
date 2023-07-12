function filterIDResults(infile,filtCutoff,plotFlag)

% Matlab program to filter inverse dynamics data stored in an OpenSim .sto
% file.
% Input data are assumed to be stored as three pelvis residual moments,
% three pelvis residual forces, and then all remaining inverse dynamic
% moments.
% 
% A third order Butterworth lowpass filter is used to perform the
% filtering, where third order is chosen to produce cubic continuity
% in the filtered joint moments.

% Inputs: infile - Name of inverse dynamics results file <basename>.sto
%             containing inverse dynamics results to be filtered (e.g.,
%             GaitTrial48_ID_results.sto).
%         filtCutoff - Low pass filter cutoff frequency in Hz.
%         plotFlag - Flag to specify whether to plot original and filtered
%             force and moment curves (0 = no, 1 = yes).
%
% Outputs: <basename>_filtered.mot

% Author: B.J. Fregly 7/1/2023

close all

% Read in inverse dynamics data from .sto file
fprintf('Reading in inverse dynamics results from file %s . . .\n', infile)
data = importdata(infile);

% Extract inverse dynamics data
time = data.data(:,1);
IDData = data.data(:,2:end);
textData = data.textdata;
colheaders=data.colheaders;

% Filter each column of ground reaction data using a 2nd order zero phase
% lag Butterworth lowerpass filter
[nRows,nCols] = size(IDData);
IDDataFilt = IDData;

% Perform filtering one inverse dynamics curve at a time
order = 3;

for k = 1:nCols
    fprintf('   Filtering ID force or moment quantity for coordinate %s . . .\n',colheaders{k+1})
    IDDataFilt(:,k) = lowpassFilter(time,IDData(:,k),order,filtCutoff,plotFlag);
end

% Output filtered inverse dynamics results
basename = strtok(infile,'.');
outfile = strcat(basename,'_filtered.sto');
fid = fopen(outfile,'w');

fprintf('Outputting filtered inverse dynamics results to file %s . . .\n', outfile)

[nHeaderRows,nHeaderCols] = size(textData);

for i = 1:nHeaderRows-1
    fprintf(fid,'%s\n',textData{i,1});
end

for i = 1:nHeaderCols-1
    fprintf(fid,'%s\t',textData{nHeaderRows,i});
end
fprintf(fid,'%s\n',textData{nHeaderRows,nHeaderCols});

for i = 1:nRows
    fprintf(fid,'%20.14f\t',time(i,1));
    
    for j = 1:nCols
        fprintf(fid,'%20.14f\t',IDDataFilt(i,j));
    end
    
    fprintf(fid,'\n');
end

fclose(fid);

end
