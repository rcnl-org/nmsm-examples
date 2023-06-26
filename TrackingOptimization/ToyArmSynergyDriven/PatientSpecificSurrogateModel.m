function [matrix] = PatientSpecificSurrogateModel(jointAngles, jointVelocities, numMuscles)
onesCol = ones(size(jointAngles, 1), 1);
zeroCol = zeros(size(jointAngles, 1), 1);
switch numMuscles
    case 1
        theta1 = jointAngles(:, 1);
        thetaDot1 = jointVelocities(:, 1);
        muscleTendonLengths = [ 5.*theta1, 10.*theta1.^2, 10.*theta1.^3, 5.*theta1.^4, theta1.^5, onesCol,];
        muscleTendonVelocities = [ 10.*thetaDot1, 40.*theta1.*thetaDot1, 60.*theta1.^2.*thetaDot1, 40.*theta1.^3.*thetaDot1, 10.*theta1.^4.*thetaDot1, zeroCol,];
        momentArms1 = [-5*onesCol, -20.*theta1, -30.*theta1.^2, -20.*theta1.^3, -5.*theta1.^4, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; ];
    case 2
        theta1 = jointAngles(:, 1);
        thetaDot1 = jointVelocities(:, 1);
        muscleTendonLengths = [ 5.*theta1, 10.*theta1.^2, 10.*theta1.^3, 5.*theta1.^4, theta1.^5, onesCol,];
        muscleTendonVelocities = [ 10.*thetaDot1, 40.*theta1.*thetaDot1, 60.*theta1.^2.*thetaDot1, 40.*theta1.^3.*thetaDot1, 10.*theta1.^4.*thetaDot1, zeroCol,];
        momentArms1 = [-5*onesCol, -20.*theta1, -30.*theta1.^2, -20.*theta1.^3, -5.*theta1.^4, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; ];
    case 3
        theta1 = jointAngles(:, 1);
        thetaDot1 = jointVelocities(:, 1);
        muscleTendonLengths = [ 5.*theta1, 10.*theta1.^2, 10.*theta1.^3, 5.*theta1.^4, theta1.^5, onesCol,];
        muscleTendonVelocities = [ 10.*thetaDot1, 40.*theta1.*thetaDot1, 60.*theta1.^2.*thetaDot1, 40.*theta1.^3.*thetaDot1, 10.*theta1.^4.*thetaDot1, zeroCol,];
        momentArms1 = [-5*onesCol, -20.*theta1, -30.*theta1.^2, -20.*theta1.^3, -5.*theta1.^4, zeroCol,];
        matrix = [muscleTendonLengths; muscleTendonVelocities;momentArms1; ];
end
end
