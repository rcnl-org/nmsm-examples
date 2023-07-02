# Synergy Driven Toy Arm

This example involves a simple arm example with 3 muscles and 2 synergies.

## Initial Setup

- Place simple_arm_muscles.osim and motion.sto in directory
- Run ID and MA in OpenSim GUI
- Organize data into 'preprocessed'

## Static Optimization

- Run GUI Static Optimization
- Move calculated activations to mtpResults/muscleActivations

## Running NCP

- Setup muscle groups in simple_arm_muscles.osim (biceps, triceps)
- add coordinates to coordinate_list
- Enable Muscle Tendon Length Initialization to save muscle properties to .osimx file
- Setup 'blank' .osimx file (simple_arm_muscles.osimx)
    - The 3 muscles will be used in Muscle Tendon Length Initialization and their activations will be tracked
- Keep all cost terms as defaults
- Setup muscle synergies (1 synergy per muscle group)
- Run script runNcpTool.m
- move trial_1_combinedActivations.sto to preprocessed/ActData

## Using Surrogate Model Creation

- copy surrogate.m
- update coordinateNames list
- update trial prefix list
- run surrogate.m (creates PatientSpecificSurrogateModel.m and coefficients.mat)

## Using Tracking Optimization

- copy gpopsSettings.xml and SynergyDrivenTrackingOptimizationSettings.xml
- remove extra cost and constraint terms
- change .osimx file path in settings file
- 

