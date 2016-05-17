% script name: "test_GIM_general_example"

% This is a general script for guiding "how to test your own scheme"
clear; clc;

k = 3;
d = k+1;                     % matrix dimension
x = (-6:6)';
vals = zeros(d,d,numel(x));

% IN THIS PART YOU SHOULD INITIAL THE VALUES in "vals"
for j=1:numel(x)
    % vals(:,:,j) = f(x(j));   % sample some matrix-valued function..
end

% THE MAIN FUNCTION
% 
% FOR "@YOUR_GIM_refinement" YOU CAN USE EITHER YOUR CODE FOR REFINEMENT OR 
% OUR IMPLEMENTATIONS OF  
% 4PT SCHEME     - "GIM_4pt_refinement" OR 
% CUBIC B-SPLINE - "GIM_CubicBspline_refinement".
%
% @YOUR_mean MUST BE ALIGNED WITH THE MANIFOLD CLASS IN USE

iterations = 4;
[ new_x, ref_vals ] = GIM_Subdivision(x, vals, @YOUR_GIM_refinement, @YOUR_mean, iterations, PARMS);
    
% THE OUTPUT VISUALIZATION SHOULD BE TAILORED TO THE MANIFOLD
% E.G, FOR SE(3) WE USE: "make_series_plots_se(x, new_x, ref_vals)"
