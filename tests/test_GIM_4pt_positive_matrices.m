% script name: "test_GIM_4pt_positive_matrices"

% testing the code with SPD matrices and geometric (geodesic) mean 

d = 3;                     %matrix dimension
x = -5:5';
vals = zeros(d,d,numel(x));
A = rand(d);
A = A+A';
for j=1:numel(x)
    % the function: f(x) = exp(x(A^2+A))
    current_A = abs(x(j))*(A^2-A);
    vals(:,:,j) = expm(current_A);
end
% alternative :  vals = GenerateSPDsData(numel(x));

[ new_x, ref_vals ] = GIM_Subdivision(x, vals, @GIM_4pt_refinement, @ALM_mean, 2, 1/16)
% or
[ new_x, ref_vals ] = GIM_Subdivision(x, vals, @GIM_CubicBspline_refinement, @ALM_mean, 2)

how_many_plots = 5;
make_series_plots_sps(x, new_x(1:how_many_plots), ref_vals(:,:,1:how_many_plots));
