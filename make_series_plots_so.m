function [  ] = make_series_plots_so(x, new_x, ref_vals)
% making plots for the case of SO(k)

n = length(new_x);
k = size(ref_vals,1);
hold on; axis equal; axis off;
for j=1:n
    current_axes   = ref_vals(:,:,j);
    current_center = [new_x(j), zeros(1,k-1)];
    if isempty(find((x-new_x(j))==0,1))
        Show_axes_plot(current_axes, current_center, 0)    % this is refeined data
    else
        Show_axes_plot(current_axes, current_center, 1)    % this is  data
    end
end

end

