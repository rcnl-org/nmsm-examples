function idResults = inverseDynamicsSolverMatlab(time, positions, velocities, accelerations, coordinateLabels, modelFileName, externalLoadsFileName)
import org.opensim.modeling.*;

if length(time) ~= size(positions, 1)
    positions = positions';
end
if length(time) ~= size(velocities, 1)
    velocities = velocities';
end
if length(time) ~= size(accelerations, 1)
    accelerations = accelerations';
end

modelProcessor  = ModelProcessor(modelFileName);
modelProcessor.append(ModOpAddExternalLoads(externalLoadsFileName));
modelProcessor.append(ModOpRemoveMuscles());
model = modelProcessor.process();
state = model.initSystem();
idSolver = InverseDynamicsSolver(model);

numFrames = length(time);
numCoords = state.getNQ;

accelerationVector = zeros(numFrames, numCoords);
for j=1:numFrames
    state.setTime(time(j));

    for k=1:length(coordinateLabels)
        if ~model.getCoordinateSet.get(coordinateLabels(k)).get_locked
            model.getCoordinateSet.get(coordinateLabels(k)).setValue(state, positions(j,k), false);
            model.getCoordinateSet.get(coordinateLabels(k)).setSpeedValue(state, velocities(j,k));
        end
    end
    model.realizeVelocity(state);

    for i=1:state.getNQ
        StateQ = state.getQ.get(i-1);

        for ii = 1:size(positions,2)
            if abs(positions(j,ii)-StateQ) <= 1e-6
                accelerationVector(j,i) = accelerations(j,ii);
            end
        end
    end

    AccelsVecOsim = Vector(state.getNQ,0);

    for i=0:state.getNQ-1
        AccelsVecOsim.set(i,accelerationVector(j,i+1));
    end

    IDLoadsVec = Vector;
    IDLoadsVec = idSolver.solve(state,AccelsVecOsim);

    for i=0:numCoords-1
        idResults(j,i+1) = IDLoadsVec.get(i);
    end
end
end
