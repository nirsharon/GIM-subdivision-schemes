% script name: "test_ALM_mean"
k = 3;

A =  randn(k); A = A+A'; A = expm(A); 
B =  randn(k); B = B+B'; B = expm(B);

norm(ALM_mean(A, B, 0)-A)

norm(ALM_mean(A, B, 1)-B)

norm(ALM_mean(A, B, .5)-ALM_mean(B, A, .5))

w = -.1;
E = ALM_mean(A, B, w);
norm(ALM_mean(E,B, (-w/(1-w)) )-A);

