% F1x F1y F1z M1x	M1y	M1z	F2x	F2y	F2z M2x	M2y	M2z	EC1x EC1y EC1z	EC2x	EC2y	EC2z

import org.opensim.modeling.*
modelFileName = 'footModel_R.osim';
model = Model(modelFileName);
pointKinematicsMexWindows(modelFileName);
storage = Storage(fullfile("preprocessed/GRFData/step_1.sto"));
[columns, experimentalTime, groundReactions] = parseMotToComponents(model, storage);
groundReactions = groundReactions';

groundReactionsBody = zeros(length(experimentalTime), 12);
groundReactionsBody(:, 1:3) = groundReactions(:, 1:3);
groundReactionsBody(:, 7:9) = groundReactions(:, 4:6);

[coordinateNames, ~, experimentalJointAngles] = parseMotToComponents(model, ...
    Storage(fullfile("preprocessed/IKData/step_1.sto")));
[experimentalJointVelocities, experimentalJointAccelerations] = ...
    calcPositionDerivatives(experimentalTime, experimentalJointAngles, 6);
experimentalJointAngles = experimentalJointAngles';
rightCalcnLocation = pointKinematics(experimentalTime', experimentalJointAngles, ...
    experimentalJointVelocities, [0 0 0], model.getBodySet.getIndex("calcn_r"), ...
    modelFileName, cellstr(coordinateNames));

groundReactionsBody(:, 7:9) = transferMoments(groundReactions(:, 7:9), ...
    rightCalcnLocation, groundReactionsBody(:, 7:9), ...
    groundReactionsBody(:, 1:3));
experimentalTime = experimentalTime';
coordinateNames = cellstr(coordinateNames);

save('testMatrixData.mat')


% Calculate position derivatives with B-spline method
function [velocities, accelerations] = calcPositionDerivatives(time, ...
    positions, cutoffFrequency)
splineDegree = 5;
numNodes = splFitWithCutoff(time, positions, cutoffFrequency, splineDegree);
[N, Np, Npp] = BSplineMatrices(splineDegree, numNodes, length(time), ...
    mean(diff(time)));

Nodes = N \ positions';
velocities = Np * Nodes;
accelerations = Npp * Nodes;
end