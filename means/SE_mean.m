function [ res ] = SE_mean(A, B, w)

k = size(A,1)-1;
inv_A = zeros(k+1);
inv_A(1:k,1:k) = A(1:k,1:k)';
inv_A(1:k,k+1) = (-1)*A(1:k,1:k)'*A(1:k,k+1);
inv_A(k+1,k+1) = 1;


midM = expm(w*logm(inv_A*B));
res = A*midM;
end

