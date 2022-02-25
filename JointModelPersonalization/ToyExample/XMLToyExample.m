
% Call the tool with xml file as argument
JointModelPersonalizationTool('ToySettingsFile.xml')

% Check result converges to expected value
newModel = Model('translation_result_from_xml.osim');
frameValue = getFrameParameterValue(newModel, 'r_elbow', 1, 1, 0);
assert(abs(frameValue-0.0061)<0.0001)