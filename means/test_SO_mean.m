% script name: "test_SO_mean"
k = 3;

[A , ~]   = qr(randn(k)); 
[B, ~]   = qr(randn(k)); % maybe rand ?

norm(SO_mean(A, B, 0)-A)

norm(SO_mean(A, B, 1)-B)

norm(SO_mean(A, B, .5)-SO_mean(B, A, .5))

E = SO_mean(A, B, -.2);
norm(E*E'-eye(k))

