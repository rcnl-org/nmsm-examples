IDsto = org.opensim.modeling.Storage("TorqueDrivenTO\IDData\arm1.sto");
controlSto = org.opensim.modeling.Storage("TorqueDrivenTO\arm1_torqueControls.sto");

[idColumns, idTime, idData] = parseMotToComponents(Model("simple_arm.osim"), IDsto);
[controlColumns, controlTime, controlData] = parseMotToComponents(Model("simple_arm.osim"), controlSto);

plot(idTime, idData, controlTime, controlData)

%%

ikSto = org.opensim.modeling.Storage("TorqueDrivenTO\IKData\arm1.sto");
[ikColumns, ikTime, ikData] = parseMotToComponents(Model("simple_arm.osim"), ikSto);
preSto = org.opensim.modeling.Storage("preprocessed\IKData\arm1.sto");
[preColumns, preTime, preData] = parseMotToComponents(Model("simple_arm.osim"), preSto);
plot(ikTime, ikData, preTime, preData)