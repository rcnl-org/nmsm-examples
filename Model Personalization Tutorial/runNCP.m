%% Run NCP

NeuralControlPersonalizationTool(fullfile("Settings files", "NCPSettings.xml"))

%% Analyze results

close all

plotNeuralControlPersonalizationActivations( ...
    fullfile("ncpResults", "synergyWeights.sto"), ...
    fullfile("ncpResults", "gait_1_synergyCommands.sto"), ...
    fullfile("mtpResults", "muscleActivations", "gait_1_muscleActivations.sto"))
