# RCNL Model for the NMSM Pipeline

This full-body OpenSim model is a modified version of the Rajagopal et al. (2016) full-body OpenSim model.

## Modifications

The modifications are as follows:

1. The physical offset frames possessing large rotations in the Walker knee model were replaced with equivalent physical offset frames requiring only small rotations to facilitate Joint Model Personalization for the knee.
2. The kinematic structure of the ankle joint model was replaced with the kinematic ankle model described by van den Bogert et al. (1994) to facilitate Joint Model Personalization for the ankle. Also, bone models r_talus.vtp and l_talus.vtp were replaced with new bone models r_talus.stl and l_talus.stl, which possess the same polygonal bone geometry but with slightly transformed coordinate systems so that visualization of the talus within the ankle complex is similar to the original model.
3. Three small hip rotator muscles present in the Arnold et al. (2010) model but removed from the Rajagopal model were added back into the Rajagopal model to facilitate matching the hip internal-external rotation moment during Muscle-tendon Model Personalization and Neural Control Model Personalization.
4. MeasuredEMGGroups, MissingEMGGroups, ActivationGroups, and NormalizedFiberLength groups were added to the model to facilitate Muscle-tendon Model Personalization and Neural Control Model Personalization.

## References

- Rajagopal, A., Dembia, C.L., DeMers, M.S., Delp, D.D., Hicks, J.L., and Delp, S.L. (2016) Full-body musculoskeletal model for muscle-driven simulation of human gait. IEEE Transactions on Biomedical Engineering 63, 2068-2079. doi: 10.1109/TBME.2016.2586891. 

- van den Bogert, A.J., Smith, G.D., and Nigg, B.M. (1994) In vivo determination of the anatomical axes of the ankle joint complex: an optimization approach. Journal of Biomechanics 27, 1477-1488. doi: 10.1016/0021-9290(94)90197-x.

- Edith M Arnold, E.M., Ward, S.R., Lieber, R.L., and Delp, S.L. (2010) A model of the lower limb for analysis of human movement. Annals of Biomedical Engineering 38, 269-279. doi: 10.1007/s10439-009-9852-5.

- Lai, A.K.M., Arnold, A.S., and Wakeling, J.M. (2016) Why are antagonist muscles co-activated in my simulation? A musculoskeletal model for analysing human locomotor tasks. Annals of Biomedical Engineering 45, 2762-2774. doi: 10.1007/s10439-017-1920-7. 

