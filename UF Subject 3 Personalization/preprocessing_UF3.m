% This function is part of the NMSM Pipeline, see file for full license.
%
% Use this script to process your EMG, IK, ID, and MuscleAnalysis data in
% preparation for the other NMSM Pipeline tools. This script is intended to
% be used after Joint Model Personalization and the IK, ID, and
% MuscleAnalysis data for this script should be generated through the 
% OpenSim GUI tools. 
%
% Modify the script below with your own filenames and preferred settings.

%% Preprocessing Script

% All values required
rawEmgFileName = fullfile("input_data", "Full_EMG.mot");
filterOrder = 4;
highPassCutoff = 40;
lowPassCutoff = 3.5 / 1.1;
processedEmgFileName = fullfile("input_data", "Full_processedEmg.mot");

processRawEmgFile(rawEmgFileName, filterOrder, highPassCutoff, ...
    lowPassCutoff, processedEmgFileName);


%% Create Muscle Tendon Velocity
% Calculates muscle-tendon velocity using B-splines and MuscleAnalysis's
% muscle-tendon length. The file is written in the same directory as the
% muscle-tendon length file.

muscleTendonLengthFileName = fullfile("input_data", ...
    "MuscleAnalysisAll", "RCNL_Fullbody_Walking_Model_Reduced_Muscles_MuscleAnalysis_Length.sto");
cutoffFrequency = 10;
createMuscleTendonVelocity(muscleTendonLengthFileName, cutoffFrequency);

%% Split OpenSim data into trials by time pairs

% Required: pairs of start/end time of events to be extracted
trialTimePairs = [
    0.5 1.6
];

% Required: Associated .osim model file
inputSettings.model = "UF_Subject_3_v8.osim";

% All values optional: files and directories of data to be split
inputSettings.ikFileName = fullfile("input_data", "GaitTrial48_IKresults.mot");
inputSettings.idFileName = fullfile("input_data", "GaitTrial48_IDresults_filtered.sto");
% The emgFileName should be the name of the *processed* emg data file
inputSettings.emgFileName = fullfile("input_data", "Full_processedEmg.mot");
inputSettings.grfFileName = fullfile("input_data", "GaitTrial48_forces_ec_reordered.mot");
inputSettings.maDirectory = fullfile("input_data", "MuscleAnalysisAll");

% All values optional: output information, uses default values otherwise
outputSettings.resultsDirectory = "preprocessed";
% The trial prefix is the prefix of each output file, identifying the
% motion such as 'gait' or 'squat' or 'step_up'.
outputSettings.trialPrefix = "gait";

splitIntoTrials( ...
    trialTimePairs, ...
    inputSettings, ...
    outputSettings ...
    )