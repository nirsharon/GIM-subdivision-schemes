function [ sc ] = EllipseDraw(A, C, varargin)
% draw centred ellipsoid for the SPD matrix A

N = 40; % Default value for grid, changed from 20 in 04-02-13
if (nargin==1)
    C = zeros(length(A));
end
% See if the user wants a different value for N.
%----------------------------------------------
if nargin > 2
 	N = varargin{1};
end


% check the dimension of the inputs: 2D or 3D
%--------------------------------------------
if length(C) == 3,
    Type = '3D';
elseif length(C) == 2,
    Type = '2D';
else
    display('Cannot plot an ellipse with more than 3 dimensions!!');
    return
end

% "singular value decomposition" to extract the orientation and the
% axes of the ellipsoid
[U D V] = svd(A);

if strcmp(Type, '2D'),
    % get the major and minor axes
    %------------------------------------
    a = 1/sqrt(D(1,1));
    b = 1/sqrt(D(2,2));

    theta = [0:1/N:2*pi+1/N];

    % Parametric equation of the ellipse
    %----------------------------------------
    state(1,:) = a*cos(theta); 
    state(2,:) = b*sin(theta);

    % Coordinate transform 
    %----------------------------------------
    X = V * state;
    X(1,:) = X(1,:) + C(1);
    X(2,:) = X(2,:) + C(2);
    
elseif strcmp(Type,'3D'),
    % generate the ellipsoid at (0,0,0)
    %----------------------------------
    a = 1/sqrt(D(1,1));
    b = 1/sqrt(D(2,2));
    c = 1/sqrt(D(3,3));
    [X,Y,Z] = ellipsoid(0,0,0,a,b,c,N);
    
    %  rotate and center the ellipsoid to the actual center point
    %------------------------------------------------------------
    XX = zeros(N+1,N+1);
    YY = zeros(N+1,N+1);
    ZZ = zeros(N+1,N+1);
    for k = 1:length(X),
        for j = 1:length(X),
            point = [X(k,j) Y(k,j) Z(k,j)]';
            P = V * point;
            XX(k,j) = P(1)+C(1);
            YY(k,j) = P(2)+C(2);
            ZZ(k,j) = P(3)+C(3);
        end
    end
end


% Plot the ellipse
%----------------------------------------
if strcmp(Type,'2D'),
    plot(X(1,:),X(2,:));
    hold on;
    plot(C(1),C(2),'r*');
    axis equal, grid
else
   % mesh(XX,YY,ZZ);
 %   axis equal
 %   hidden off
    sc(:,:,1) = XX;
    sc(:,:,2) = YY;
    sc(:,:,3) = ZZ;
    surf(XX,YY,ZZ);
end