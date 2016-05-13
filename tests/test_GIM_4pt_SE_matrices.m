% script name: "test_GIM_4pt_SE_matrices"

% we test the GIM 4pt-scheme for SE(k) data

clear; clc;

k = 3;
d = k+1;                     % matrix dimension
x = (-5:5)';
vals = zeros(d,d,numel(x));

% fixed start
mat_fixed = rand(k);
mat_fixed = mat_fixed - mat_fixed';

for j=1:numel(x)
    % Helix function for the translational component
    b = zeros(k,1);
    b(1) = sin(x(j)/2);
    b(2) = cos(x(j)/2);
    b(3) = x(j)/3;
    
    %  the SO-valued function:  f(x) = (exp(xQ))^2, for the rotational part
    mu = expm((x(j))*mat_fixed);
    mu = mu*mu;
    
    A = zeros(d);
    A(1:k,1:k)= mu;
    A(1:k,1+k)= b;
    A(1+k,1+k)= 1;
    vals(:,:,j) = A;
end

movie_on = 0;  % currently disabled
if movie_on
    movie_name = 'GIM_movie.avi';
    shape_data = 'b1.ply';
    [ new_x, ref_vals ] = GIM_Subdivision(x, vals, @GIM_4pt_refinement, @SE_mean, 4, 1/15);
    make_movie( ref_vals, shape_data ,movie_name );
else
    [ new_x, ref_vals ] = GIM_Subdivision(x, vals, @GIM_4pt_refinement, @SE_mean, 3, 1/16);
    make_series_plots_se(x, new_x, ref_vals);
end
