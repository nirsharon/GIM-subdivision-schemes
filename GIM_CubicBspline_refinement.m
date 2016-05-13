function [ refined_x, refined_vals ] = GIM_CubicBspline_refinement(x, vals, avg_func)
% The GIM adaptation to the cubic B-spline


if numel(x)<3
    error('not enough data to refine')
end

% we "loose" one data value from each side
new_len = (numel(x)-2)*2+1;
refined_x = zeros(new_len,1);
refined_vals = zeros(size(vals,1),size(vals,2),new_len);

% first point
    % interpolation points
    refined_x(1) = (x(1)+x(2))/2;
    refined_vals(:,:,1) = GIMcubicBspline_rules(vals(:,:,1:2), 0, avg_func);
 
% main loop
for j=2:(numel(x)-1)
    current_index = 2*(j-1);
    % interpolation points
    refined_x(current_index) = x(j);
    refined_vals(:,:,current_index) = GIMcubicBspline_rules(vals(:,:,(j-1):(j+1)), 1, avg_func);
    % new refined points
    refined_x(current_index+1) = (x(j)+x(j+1))/2;
    refined_vals(:,:,current_index+1) = GIMcubicBspline_rules(vals(:,:,[j,j+1]), 0, avg_func);
end

end

