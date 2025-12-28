function rmse = computeRMSE(observedPts, computedPts)
% computeRMSE - Root Mean Square Error between observed and computed points
%
% Syntax:
%   rmse = computeRMSE(observedPts, computedPts)
%
% Inputs:
%   observedPts  - Nx2 matrix of reference coordinates
%   computedPts  - Nx2 matrix of transformed coordinates
%
% Output:
%   rmse - scalar RMSE value

if size(observedPts,1) ~= size(computedPts,1)
    error('Observed and computed points must have the same number of rows.');
end

diff = observedPts - computedPts;
rmse = sqrt(mean(diff(:,1).^2 + diff(:,2).^2));
end
