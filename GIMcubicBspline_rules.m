function [ new_val ] = GIMcubicBspline_rules(vals, new_point, avg_func)
% refinement rules for the GIM adaptation of the cubic B-spline

if new_point==0  % odd indices, 
    new_val = avg_func(vals(:,:,1),vals(:,:,2),.5);
else             % even indices
    one_avg = avg_func(vals(:,:,1),vals(:,:,2),.75);
    second_avg = avg_func(vals(:,:,2),vals(:,:,3),.25);
    new_val = avg_func(one_avg,second_avg,.5);
end

