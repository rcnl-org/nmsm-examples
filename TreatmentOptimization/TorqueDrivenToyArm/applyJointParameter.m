function inputs = applyJointParameter(inputs, values)
value = values.parameters.elbow_translation;
jointName = "r_elbow";
coordinateNumber = 0;
inputs.auxdata.model = Model(inputs.auxdata.model);
adjustParentTranslation( ...
    inputs.auxdata.model, jointName, coordinateNumber, value);
end

