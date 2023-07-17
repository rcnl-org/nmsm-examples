%% Run GCP
tic
GroundContactPersonalizationTool(fullfile("settings_files", "GCPSettings.xml"))
toc
%% Analyze results

close all

plotGcpFootKinematicsFromFiles( ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot_1_experimentalFootKinematics.sto"), ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot_1_optimizedFootKinematics.sto"), 1)

plotGcpGroundReactionsFromFiles( ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot_1_replacedExperimentalGroundReactions.sto"), ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot_1_optimizedGroundReactions.sto"), 2)
