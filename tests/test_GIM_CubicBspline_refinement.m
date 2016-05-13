% script name: "test_GIM_CubicBspline_refinement"

% testing for SO(d) data and GIM - cubic B-spline

clear; clc;

d = 3;                          % matrix dimension
x = (-5:5)';                    % parametric domain
vals = zeros(d,d,numel(x));

% fixed start
mat_fixed = rand(d);
mat_fixed = mat_fixed - mat_fixed';

for j=1:numel(x)
    
    %  the SO-valued function:  f(x) = (exp(xQ))^2
    mu = expm((x(j)/2)*mat_fixed);
    mu = mu*mu;
    
    vals(:,:,j) = mu;
end

movie_on = 0; % currently disabled
if movie_on
    movie_name = 'GIM_movie.avi';
    shape_data = 'b1.ply';
    [ new_x, ref_vals ] = GIM_Subdivision(x, vals, @GIM_CubicBspline_refinement, @SO_mean, 4);
    make_movie( ref_vals, shape_data ,movie_name );
else
    iterations = 3;
    [ new_x, ref_vals ] = GIM_Subdivision(x, vals, @GIM_CubicBspline_refinement, @SO_mean, iterations);
    make_series_plots_so(x, new_x, ref_vals);
end
