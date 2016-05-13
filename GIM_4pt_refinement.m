function [ refined_x, refined_vals ] = GIM_4pt_refinement(x, vals, avg_func, omega)
% omega is the additional parameter for this refinement

if nargin<4
    omega = 1/16;
end

if numel(x)<4
    error('not enough data to refine')
end

% we "loose" one data value from each side
new_len = (numel(x)-3)*2+1;
refined_x = zeros(new_len,1);
refined_vals = zeros(size(vals,1),size(vals,2),new_len);

% main loop
for j=2:(numel(x)-2)
    current_index = 2*(j-1)-1;
    % interpolation points
    refined_x(current_index) = x(j);
    refined_vals(:,:,current_index) = GIM_4pt_rules(vals(:,:,j), 0, avg_func, omega);
    % new refined points
    refined_x(current_index+1) = (x(j)+x(j+1))/2;
    refined_vals(:,:,current_index+1) = GIM_4pt_rules(vals(:,:,[j-1,j,j+1,j+2]), 1, avg_func, omega);
end
% last point - interpolation
last_ind = numel(x)-1;
refined_x(2*(last_ind-1)-1) = x(last_ind);
refined_vals(:,:,(2*(last_ind-1)-1)) = GIM_4pt_rules(vals(:,:,last_ind), 0, avg_func, omega);

end

