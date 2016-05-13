function [ res ] = SO_mean(A, B, w)

midM = expm(w*logm(A'*B));
res = A*midM;
end

