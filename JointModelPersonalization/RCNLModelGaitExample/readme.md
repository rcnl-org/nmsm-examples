This example shows the process of using Joint Model Personalization, starting from the unscaled RCNL model. 

## Step 1: Model Scaling

Start with the full-body model RCNL2023.osim, which is a modified version of the Rajagopal et al. (2016) model that facilities the Joint Model Personalization process. These modifications include simplified but equivalent definitions of knee joint PhysicalOffsetFrames such that all orientation parameters are acute, new ankle joint kinematic models consistent with van den Bogert et al. (1994), added and unlocked knee adduction angles, mtp (toes) angles locked to -10 deg to account for slight toes extension inside the shoe, and toes markers that are attached to each calcaneus temporarily rather than the toes segment. Note that the new ankle joint kinematic model includes a new low-mass intermediate body, the pretalus, which was added to allow translating the ankle joint axis superiorly/inferiorly in the tibia body without moving the talus bone geometry into/out of the tibia bone geometry.

Copy this model to the new name UF_Subject_3_v1.osim and update the marker names in this model to match the experimental marker names. Whenever possible, leave the model markers in their original locations when renaming markers. Make small adjustments to model marker locations as needed to be consistent with the experimental marker placements. Also adjust the heights of the heel markers, toe markers, medial toe markers, and lateral toe markers in the calcaneus bodies such that their Y locations relative to each other are consistent with the height of the same markers above the floor in the static trial experimental marker data.

Perform model scaling placing a larger weight on the heel, toes, medial toes, and lateral toes markers so that the bottom of the feet in the scaled model end up approximately parallel to the floor.

After model scaling is completed, lock the right and left knee adduction angles to the values shown for the static pose, move the toe markers from their respective calcaneus bodies to their respective toes bodies, unlock the right and left mtp angles, and remove medial and lateral toes, ankle, and knee “static” markers since they will not be needed for subsequent model personalization steps and will slow down joint model personalization. If desired, the medial and lateral toes markers can be retained since they will be needed if Ground Contact Model Personalization is performed after completing Joint Model Personalization.

Name the final scaled model with these changes UF_Subject_3_v2.osim.

## Step 2: Right ankle joint personalization

Review the Joint Model Personalization (JMP) settings file JMPRAnkleSettingsv3.xml for how joint locations and orientations in the right tibia, talus, and calcaneus are allowed to change during kinematic model personalization. Use starting model UF_Subject_3_v2.osim and experimental marker data ‘RAnkleTrial_markers_jmp.trc.’ This marker datafile was collected for an unloaded right ankle circumduction motion and has been trimmed to one cycle of motion.

In Matlab, run JMP for the right ankle joint using the following Matlab command:

>> JointModelPersonalizationTool(‘JMPRAnkleSettingsv3.xml’)

The updated model with personalized right ankle joint kinematic model is output as UF_Subject_3_v3.osim.

## Step 3: Right knee joint personalization

Review the JMP settings file JMPRKneeSettingsv4.xml for how joint orientations in the right femur and tibia are allowed to change during kinematic model personalization. Use starting model UF_Subject_3_v3.osim and experimental marker data ‘RKneeTrial_markers_jmp.trc.’ This marker datafile was collected for an unloaded right knee flexion-extension motion and has been trimmed to one cycle of motion with all data beyond 70 deg of knee flexion removed, since walking typically involves only 70 deg of knee flexion, and since the OpenSim knee model is inaccurate at large knee flexion angles.

In Matlab, run JMP for the right ankle joint using the following Matlab command:

>> JointModelPersonalizationTool(‘JMPRKneeSettingsv4.xml’)

The updated model with personalized right knee joint kinematic model is output as UF_Subject_3_v4.osim.

## Step 4: Left ankle joint personalization

Review the Joint Model Personalization (JMP) settings file JMPLAnkleSettingsv5.xml for how joint locations and orientations in the left tibia, talus, and calcaneus are allowed to change during kinematic model personalization. Use starting model UF_Subject_3_v4.osim and experimental marker data ‘LAnkleTrial_markers_jmp.trc.’ This marker datafile was collected for an unloaded left ankle circumduction motion and has been trimmed to one cycle of motion.

In Matlab, run JMP for the right ankle joint using the following Matlab command:

>> JointModelPersonalizationTool(‘JMPRAnkleSettingsv5.xml’)

The updated model with personalized right ankle joint kinematic model is output as UF_Subject_3_v5.osim.

## Step 5: Left knee joint personalization

Review the JMP settings file JMPLKneeSettingsv6.xml for how joint orientations in the left femur and tibia are allowed to change during kinematic model personalization. Use starting model UF_Subject_3_v5.osim and experimental marker data ‘LKneeTrial_markers_jmp.trc.’ This marker datafile was collected for an unloaded left knee flexion-extension motion and has been trimmed to one cycle of motion with all data beyond 70 deg of knee flexion removed, since walking typically involves only 70 deg of knee flexion, and since the OpenSim knee model is inaccurate at large knee flexion angles.

In Matlab, run JMP for the right ankle joint using the following Matlab command:

>> JointModelPersonalizationTool(‘JMPRKneeSettingsv6.xml’)

The updated model with personalized right knee joint kinematic model is output as UF_Subject_3_v6.osim.

Now that the ankles and knee joint models in both legs have been personalized to the subject’s isolated joint motion data, visually inspect model UF_Subject_3_v6.osim in the OpenSim GUI for differences between the two legs. Note in particular the one foot is slightly lower than the other, which is expected since the data and the joint model personalization process are imperfect.

## Step 6: Both legs personalization

Review the JMP settings file JMPBothLegsSettingsv7.xml for how joint orientations in the right and left femur, tibia, and pretalus, joint translations in the right and left calcaneus, body scaling of the right and left femur and tibia, and marker locations on the pelvis and right and left femur and tibia are allowed to change during kinematic model personalization. Use starting model UF_Subject_3_v6.osim and experimental marker data ‘GaitTrial_markers_jmp.trc.’ This marker datafile was collected for a 60-second treadmill gait trial and has been trimmed to one cycle of motion. Performing the final joint model personalization step on both legs together using an experimental gait cycle allows for slight additional adjustments of joint parameters, body scaling, and marker locations consistent with the loaded gait motions to be analyzed.

In Matlab, run JMP for the both legs together using the following Matlab command:

>> JointModelPersonalizationTool(‘JMPRKneeSettingsv7.xml’)

The updated model with personalized hip, knee, and ankle models is output as UF_Subject_3_v7.osim.

Now that both legs have been personalized to the subject’s gait motion data, visually inspect model UF_Subject_3_v7.osim in the OpenSim GUI for differences between the two legs. Note in particular the one foot is again slightly lower than the other but that which foot is slightly lower has changed.

## Step 7: Both legs manual adjustments

Since the subject from whom these data were collected is highly symmetric, the final step is to make small manual adjustments to the right and left ankle and subtalar joint parameters and to the right and left femur and tibia body scaling such that the final model is highly symmetric.

After these manual adjustments are made, the final model is called UF_Subject_3_v8.osim.