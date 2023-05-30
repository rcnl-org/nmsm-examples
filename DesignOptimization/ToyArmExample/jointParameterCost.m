function cost = jointParameterCost(values, modeledValues, auxdata, costTerm)
markerFileName = "simple_arm.trc";
params = struct();
markersReference = makeJmpMarkerRef( ...
    auxdata.model, markerFileName, params);
cost = computeInnerOptimizationHeuristic( ...
    auxdata.model, markersReference, params);
markersReference = libpointer;
java.lang.System.gc();
end

