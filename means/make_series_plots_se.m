function [  ] = make_series_plots_se(x, new_x, ref_vals)
% making plots for the case of SE(k)

n = length(new_x);
k = size(ref_vals,1)-1;
hold on; axis equal; axis off;
for j=1:n
    current_axes   = ref_vals(1:k,1:k,j);
    current_center = ref_vals(1:k,1+k,j);
    if isempty(find((x-new_x(j))==0,1))
        Show_axes_plot(current_axes, current_center, 0)    % this is refeined data
    else
        Show_axes_plot(current_axes, current_center, 1)    % this is  data
    end
end

% plotting the curve of centers
plot3(squeeze(ref_vals(1,1+k,:)),...
    squeeze(ref_vals(2,1+k,:)),...
    squeeze(ref_vals(3,1+k,:)),'-k');
end

