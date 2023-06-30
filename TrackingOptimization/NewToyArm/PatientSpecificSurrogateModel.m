function [matrix] = PatientSpecificSurrogateModel(jointAngles, jointVelocities, numMuscles)
onesCol = ones(size(jointAngles, 1), 1);
zeroCol = zeros(size(jointAngles, 1), 1);
switch numMuscles
    case 1
        theta1 = jointAngles(:, 1);
        thetaDot1 = jointVelocities(:, 1);
        muscleTendonLengths = [ 6.*theta1, 15.*theta1.^2, 20.*theta1.^3, 15.*theta1.^4, 6.*theta1.^5, theta1.^6, onesCol,];
        muscleTendonVelocities = [ 12.*thetaDot1, 60.*theta1.*thetaDot1, 120.*theta1.^2.*thetaDot1, 120.*theta1.^3.*thetaDot1, 60.*theta1.^4.*thetaDot1, 12.*theta1.^5.*thetaDot1, zeroCol,];
        momentArms1 = [-6*onesCol, -30.*theta1, -60.*theta1.^2, -60.*theta1.^3, -30.*theta1.^4, -6.*theta1.^5, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; ];
    case 2
        theta1 = jointAngles(:, 1);
        thetaDot1 = jointVelocities(:, 1);
        muscleTendonLengths = [ 6.*theta1, 15.*theta1.^2, 20.*theta1.^3, 15.*theta1.^4, 6.*theta1.^5, theta1.^6, onesCol,];
        muscleTendonVelocities = [ 12.*thetaDot1, 60.*theta1.*thetaDot1, 120.*theta1.^2.*thetaDot1, 120.*theta1.^3.*thetaDot1, 60.*theta1.^4.*thetaDot1, 12.*theta1.^5.*thetaDot1, zeroCol,];
        momentArms1 = [-6*onesCol, -30.*theta1, -60.*theta1.^2, -60.*theta1.^3, -30.*theta1.^4, -6.*theta1.^5, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; ];
    case 3
        theta1 = jointAngles(:, 1);
        thetaDot1 = jointVelocities(:, 1);
        muscleTendonLengths = [ 6.*theta1, 15.*theta1.^2, 20.*theta1.^3, 15.*theta1.^4, 6.*theta1.^5, theta1.^6, onesCol,];
        muscleTendonVelocities = [ 12.*thetaDot1, 60.*theta1.*thetaDot1, 120.*theta1.^2.*thetaDot1, 120.*theta1.^3.*thetaDot1, 60.*theta1.^4.*thetaDot1, 12.*theta1.^5.*thetaDot1, zeroCol,];
        momentArms1 = [-6*onesCol, -30.*theta1, -60.*theta1.^2, -60.*theta1.^3, -30.*theta1.^4, -6.*theta1.^5, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; ];
end
end
