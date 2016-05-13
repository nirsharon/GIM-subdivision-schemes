function [ Ar ] = GenerateSPDsData( N )
% We generate N size array of random 3X3 SPDs Matrices

B=rand(3,3);
C=rand(3,3);
B=B*B';
C=C*C';

A(:,:,1:N)=zeros(3,3,N);
for m=1:N
    % tol = .1;
    % A(:,:,m)=expm((m/16)*B)+expm(((16-m)/16)*C);
    A(:,:,m)=expm((m/16)*B)+expm(((16-m)/16)*C);
end
Ar = A;
end

