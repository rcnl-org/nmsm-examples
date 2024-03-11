load('testMatrixData.mat')

if 1
inverseDynamicsMexWindows('footModel_1_actuators.osim')

numMuscles = 0;
numFrames = 141;
appliedLoads = [zeros(numFrames, numMuscles) groundReactionsBody];
tic
inverseDynamicMomentsMex = inverseDynamicsMexWindows(experimentalTime, ...
    experimentalJointAngles, experimentalJointVelocities, ...
    experimentalJointAccelerations, coordinateNames, appliedLoads);
toc
tic
inverseDynamicMomentsMatlab = inverseDynamicsSolverMatlab(experimentalTime, ...
    experimentalJointAngles, experimentalJointVelocities, ...
    experimentalJointAccelerations, string(coordinateNames), ...
    'footModel_1_actuators.osim', 'external_loads.xml');
toc
muscleActuatedMomentsIndex = 1:length(coordinateNames);
figure
for i = 1:7
    subplot(3,3,i)
    plot(inverseDynamicMomentsMex(:, muscleActuatedMomentsIndex(i)), 'r', 'LineWidth', 2)
    hold on
    plot(inverseDynamicMomentsMatlab(:, muscleActuatedMomentsIndex(i)), 'b', 'LineWidth', 2)
    title(coordinateNames{muscleActuatedMomentsIndex(i)})
end
end

if 0
PointKinematics('exampleModel.osim')
tic
[positionsMex, velocitiesMex] = PointKinematics(experimentalTime, ...
    experimentalJointAngles, experimentalJointVelocities, [0 0 0]', [0], ...
    coordinateNames);
toc
tic
[positionsMatlab, velocitiesMatlab] = PointKinematicsMatlab(experimentalTime, ...
    experimentalJointAngles, experimentalJointVelocities, [0 0 0], [0], ...
    'exampleModel.osim', coordinateNames);
toc

figure
for i = 1:3
    subplot(1,3,i)
    plot(positionsMex(:, i), 'r', 'LineWidth', 2)
    hold on
    plot(positionsMatlab(:, i), 'b', 'LineWidth', 2)
end
end