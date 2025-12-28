function transformedPts = applyAffine(points, params)
n = size(points,1);
A = zeros(2*n,6);

for i = 1:n
    X = points(i,1);
    Y = points(i,2);

    A(2*i-1,:) = [X Y 1 0 0 0];
    A(2*i  ,:) = [0 0 0 X Y 1];
end

result = A * params;
transformedPts = reshape(result,2,[])';
end
