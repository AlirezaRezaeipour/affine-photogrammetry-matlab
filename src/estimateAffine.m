function params = estimateAffine(sourcePts, targetPts)
n = size(sourcePts,1);
A = zeros(2*n,6);
L = zeros(2*n,1);

for i = 1:n
    X = sourcePts(i,1);
    Y = sourcePts(i,2);

    A(2*i-1,:) = [X Y 1 0 0 0];
    A(2*i  ,:) = [0 0 0 X Y 1];

    L(2*i-1) = targetPts(i,1);
    L(2*i  ) = targetPts(i,2);
end

params = A \ L;
end
