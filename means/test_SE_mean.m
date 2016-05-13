% script name: "test_SE_mean"
k = 3;

A = zeros(k+1);
[mu, ~]   = qr(randn(k)); % maybe rand ?
mu(:,k) = det(mu)*mu(:,k);
b = rand(k,1);

A(1:k,1:k)= mu;
A(1:k,1+k)= b;
A(1+k,1+k)= 1;

B = zeros(k+1);
[mu, ~]   = qr(randn(k)); % maybe rand ?
mu(:,k) = det(mu)*mu(:,k);
b = rand(k,1);

B(1:k,1:k)= mu;
B(1:k,1+k)= b;
B(1+k,1+k)= 1;

norm(SE_mean(A, B, 0)-A)

norm(SE_mean(A, B, 1)-B)

norm(SE_mean(A, B, .5)-SE_mean(B, A, .5))

E = SE_mean(A, B, -.2);
norm(E(1:k,1:k)*E(1:k,1:k)'-eye(k))

