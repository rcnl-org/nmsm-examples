
import org.opensim.modeling.*
% model file path assumes nmsm-core project is open
inputs.model = 'simple_arm_translated_away.osim';

% Joint parameters to optimize
task1.parameters = {
    %{jointName, isParent, isTranslation, paramNum}
    {'r_elbow', 1, 1, 0}, ... %Translation of x in the parent frame
};
% Associated marker file for task 1
task1.markerFile = 'simple_arm.trc';
% Add task to cell array of tasks as part of the input struct
inputs.tasks{1} = task1;

% Add desired error
inputs.desiredError = 0.01;

params.accuracy = 1e-6; % accuracy of the Inverse Kinematics Solver
params.display = 'iter';

newModel = JointModelPersonalization(inputs, params);
assert(isa(newModel, 'org.opensim.modeling.Model'))

% getFrameParameterValue() returns the current joint parameter value in the
% given model.
frameValue = getFrameParameterValue(newModel, 'r_elbow', 1, 1, 0);
assert(abs(frameValue-0.0061)<0.0001)

newModel.print("translation_result.osim")
