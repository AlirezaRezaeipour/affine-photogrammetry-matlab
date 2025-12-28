clc; clear; close all;
addpath('../src');

clib = load('../data/calibrated_points.txt');
comp = load('../data/comparator_points.txt');
arb  = load('../data/arbitrary_points.txt');

calibratedPts = clib(:,2:3);
comparatorPts = comp(:,2:3);
arbitraryPts  = arb(:,2:3);

params = estimateAffine(comparatorPts, calibratedPts);

arb_tf = applyAffine(arbitraryPts, params);
calib_tf = applyAffine(comparatorPts, params);

rmse = computeRMSE(calibratedPts, calib_tf);
fprintf('RMSE (Affine): %.6f\n', rmse);

figure;
plot(calibratedPts(:,1),calibratedPts(:,2),'ro','DisplayName','Calibrated');
hold on;
plot(arb_tf(:,1),arb_tf(:,2),'b.','DisplayName','Affine Transformed');
legend; grid on; axis equal;
title('2D Affine Photogrammetric Transformation');
