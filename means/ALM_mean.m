function [ res ] = ALM_mean(A, B, w)

A_half = sqrtm(A);
A_min_half = inv(A_half);
if w>0
    midM = (A_min_half*B*A_min_half)^w;
else
    midM = inv((A_min_half*B*A_min_half)^(-w));
end
res = A_half*midM*A_half;
end

