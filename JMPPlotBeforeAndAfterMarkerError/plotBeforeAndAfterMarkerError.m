
% List markers of interest. for this example, it is the markers about the
% knee joint.
markerNames = ["L.Thigh.Superior", "L.Thigh.Inferior", ...
    "L.Thigh.Lateral", "L.Shank.Superior", "L.Shank.Inferior", ...
    "L.Shank.Lateral"];

% Generate the .sto file for the marker error values for the original
% model.
reportDistanceErrorByMarker('Rajagopal_4.0_RCNL_markers_scaled.osim', ...
    'l_knee.trc', markerNames, 'start.sto')

% Generate the .sto file for the marker error values after JMP. In this
% case, the knee isolated trial was used to optimize the knee parameters.
reportDistanceErrorByMarker( ...
    'Rajagopal_4.0_RCNL_markers_scaled_knee.osim', 'l_knee.trc', ...
    markerNames, 'finish.sto')

% Create the plot. A value of false means each pair is plotted separately,
% a value of true means all are plotted together.
plotMarkerDistanceErrors(["start.sto", "finish.sto"], false)