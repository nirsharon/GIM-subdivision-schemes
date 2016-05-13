function [ new_val ] = GIM_4pt_rules(vals, new_point, avg_func, omega)
% Refinement rules for the GIM adaptation of the 4-pt

if new_point==0  % odd indices, interpolation
    new_val = vals;
else             % even indices, refinement
    one_avg = avg_func(vals(:,:,2),vals(:,:,1),-2*omega);
    second_avg = avg_func(vals(:,:,3),vals(:,:,4),-2*omega);
    new_val = avg_func(one_avg,second_avg,.5);
end

