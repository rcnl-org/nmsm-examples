function cost = jointParameterCost(inputs)
markerFileName = "simple_arm.trc";
params = struct();
markersReference = makeJmpMarkerRef( ...
    inputs.auxdata.model, markerFileName, params);
cost = computeInnerOptimizationHeuristic( ...
    inputs.auxdata.model, markersReference, params);
markersReference = libpointer;
java.lang.System.gc();
end

