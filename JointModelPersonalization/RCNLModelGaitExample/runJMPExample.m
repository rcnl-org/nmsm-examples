%% Calibration starts using version 2, scaled from version 1
% Calibrate right ankle using only joint parameters (v3)

JointModelPersonalizationTool(fullfile("settings_files", "JMPRAnkleSettingsv3.xml"))

%% Calibrate right knee using only joint parameters (v4)

JointModelPersonalizationTool(fullfile("settings_files", "JMPRKneeSettingsv4.xml"))

%% Calibrate left ankle using only joint parameters (v5)

JointModelPersonalizationTool(fullfile("settings_files", "JMPLAnkleSettingsv5.xml"))

%% Calibrate left knee using only joint parameters (v6)

JointModelPersonalizationTool(fullfile("settings_files", "JMPLKneeSettingsv6.xml"))

%% Calibrate both legs using joint, body, and marker parameters (v7)

JointModelPersonalizationTool(fullfile("settings_files", "JMPBothLegsSettingsv7.xml"))
