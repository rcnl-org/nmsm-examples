%% Run GCP

GroundContactPersonalizationTool(fullfile("Settings files", "GCPSettings.xml"))

%% Analyze results

close all

plotGcpFootKinematicsFromFiles( ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot1_experimentalFootKinematics.sto"), ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot1_optimizedFootKinematics.sto"), 1)

plotGcpGroundReactionsFromFiles( ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot1_replacedExperimentalGroundReactions.sto"), ...
    fullfile("gcpResults", "UF_Subject_3_reduced_muscles_Foot1_optimizedGroundReactions.sto"), 2)
