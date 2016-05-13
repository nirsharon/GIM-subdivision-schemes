% script name: "test_GIM_element_wise"

%--------------------------------------------------------------------------
% The code is designed for matrices. However, we can use Euclidean average,
% and to use any entries of the matrices to have the standard, linear
% subdivision schemes.
%--------------------------------------------------------------------------

d = 3;                          % matrix dimension
x = (-5:5)';                    % parametric sites
vals = zeros(d,d,numel(x));
for j=1:numel(x)
    A = rand(d);
    b = zeros(d,1);
    b(1) = sin(x(j));
    b(2) = cos(x(j));
    b(3) = x(j);
    vals(:,1,j) = b;
end

[ new_x1, ref_vals1 ] = GIM_Subdivision(x, vals, @GIM_4pt_refinement, @Euc_mean, 4, 1/16);
figure(); plot3(squeeze(ref_vals1(1,1,:)),squeeze(ref_vals1(2,1,:)),squeeze(ref_vals1(3,1,:)),'LineWidth',3)

[ new_x, ref_vals ] = GIM_Subdivision(x, vals, @GIM_CubicBspline_refinement, @Euc_mean, 4);
figure(); plot3(squeeze(ref_vals(1,1,:)),squeeze(ref_vals(2,1,:)),squeeze(ref_vals(3,1,:)),'LineWidth',3)

