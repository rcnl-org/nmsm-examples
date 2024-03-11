import org.opensim.modeling.Storage;
modelFileName = "footModel_1.osim";
externalLoadsFileName = "external_loads.xml";
[coordinateLabels, time, positions] = parseMotToComponents( ...
    Model(modelFileName), Storage(fullfile("preprocessed", "IKData", "step_1.sto")));

[velocities, accelerations] = calcPositionDerivatives(time, positions, 6);


idResults = inverseDynamicsSolverMatlab(time, positions', velocities, accelerations, coordinateLabels, modelFileName, externalLoadsFileName);

coordinateLabels = coordinateLabels + repmat("_moment", 1, length(coordinateLabels));

writeToSto(coordinateLabels, time, idResults, fullfile("preprocessed/IDData/step_1.sto"))


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