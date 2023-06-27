
armModel = Model("simple_arm_muscles.osim");

newModel = org.opensim.modeling.Model();

newModel.addBody(armModel.getBodySet().get(0));
newModel.addBody(armModel.getBodySet().get(1));
newModel.addJoint(armModel.getJointSet().get(1));
for i = 0:armModel.getForceSet().getSize() - 1
    newModel.addForce(armModel.getForceSet().get(i))
end
for i = 0:armModel.getMarkerSet().getSize() - 1
    newModel.addMarker(armModel.getMarkerSet().get(i))
end

weldJoint = org.opensim.modeling.WeldJoint("Weld", newModel.getGround(), newModel.getBodySet().get(0));

newModel.addJoint(weldJoint);

newModel.finalizeConnections();

newModel.print("test.osim");
