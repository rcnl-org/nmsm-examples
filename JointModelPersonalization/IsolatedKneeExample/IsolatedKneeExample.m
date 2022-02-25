
% Make sure the nmsm-core project is open by double-clicking Project.prj in
% the nmsm-core repository.
JointModelPersonalizationTool('IsolatedReinboltKneeExample.xml')

% calculate improvement in marker error for markers on distal and proximal
% bodies
start = sqrt(calculateJointError('Rajagopal_4.0_RCNL_markers_scaled.osim', ...
    1, jointArray, markerFile, 1e-6))

final = sqrt(calculateJointError('Rajagopal_4.0_RCNL_markers_scaled_knee.osim', ...
    1, jointArray, markerFile, 1e-6))

improvement = (final - start) / start

% use plotBeforeAndAfterMarkerError.m example to visualize difference