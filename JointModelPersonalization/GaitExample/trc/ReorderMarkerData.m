function ReorderMarkerData(trialname,x,y,z,scale)

% Matlab program to change order of and scale columns in a
% marker data .trc file.
%
% Inputs: trialname - Name of experimental trial
%             (e.g., drive_kick1), which will read in
%             input file <trialname>.trc (e.g., drive_kick1.trc)
%         x - Columns from original .trc marker file
%             to be used to populate the x columns of
%             the reordered marker file.
%         y - Columns from original .trc marker file
%             to be used to populate the x columns of
%             the reordered marker file.
%         z - Columns from original .trc marker file
%             to be used to populate the x columns of
%             the reordered marker file.
%         scale - Scale factor to be applied to all
%             marker coordinates.
%
%         Columns from original .trc marker file are indicated
%         by 1 for the x column, -1 for the negative of the
%         x column, 2 for the y column, -2 for the negative of
%         the y column, 3 for the z column, and -3 for the
%         negative of the z column.
%
% Outputs: <trialname>_reordered.trc
%
% Note that while the output file <trialname>_reordered.trc
% will contain the original header rows, any change in units
% (e.g., mm to m), as specified by a value of scale != 1,
% must be changed manually in the output file.
%
% As an example of how to use the program, if the columns
% of trial drive_kick1 are to be processed such that
% Original x => New x
% Original z => New y
% Original -y => New z
% and where the units of the marker data are to be changed
% from mm to m, then the program would be called as
%
% >> ReorderMarkerData('drive_kick1',1,3,-2,0.001)
%
% Original data file drive_kick1.trc will be read in, and
% output data file drive_kick1_reordered.trc will be output.
% Units in the output file will have to be changed from mm
% to m.

% Read 6 header lines from input .trc file
infile = strcat(trialname,'.trc');
fid = fopen(infile);
header1 = fgetl(fid);
header2 = fgetl(fid);
header3 = fgetl(fid);
header4 = fgetl(fid);
header5 = fgetl(fid);
header6 = fgetl(fid);

% Read marker data as one long column
data = fscanf(fid,'%f');
fclose(fid);

% Reshape marker data based on number of rows and
% columns of marker data specified in the input data
% file, with two extra columns for frame and time
info = sscanf(header3,'%f %f %d %d');
nrows = info(3,1);
ncols = info(4,1)*3;
data = reshape(data,ncols+2,nrows)';

% Separate frame and time vectors from marker data
frame_time_data = data(:,1:2);
marker_data = data(:,3:ncols+2);

% Scale marker data to new units
marker_data = scale*marker_data;

% Create 3 x 3 perumation matrix
permutation_matrix = zeros(3,3);
permutation_matrix(abs(x),1) = sign(x);
permutation_matrix(abs(y),2) = sign(y);
permutation_matrix(abs(z),3) = sign(z);

% Reorder marker data based on permutation matrix
new_marker_data = zeros(nrows,ncols);

for i = 1:3:ncols-2
    new_marker_data(:,i:i+2) = marker_data(:,i:i+2)*permutation_matrix;
end

% Output permuted and scaled data
outfile = strcat(trialname,'_reordered.trc');
fid = fopen(outfile,'w');
fprintf(fid,'%s\n',header1);
fprintf(fid,'%s\n',header2);
fprintf(fid,'%s\n',header3);
fprintf(fid,'%s\n',header4);
fprintf(fid,'%s\n',header5);
fprintf(fid,'%s\n',header6);

for i = 1:nrows
    fprintf(fid,'%d\t',frame_time_data(i,1));
    fprintf(fid,'%5.3f\t',frame_time_data(i,2));
    
    for j = 1:ncols
        fprintf(fid,'%11.5f\t',new_marker_data(i,j));
    end
    
    fprintf(fid,'\n');
end

fclose(fid);





