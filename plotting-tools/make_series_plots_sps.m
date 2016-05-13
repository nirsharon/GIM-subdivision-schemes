function [  ] = make_series_plots_sps(x, new_x, ref_vals)
% making plots for the case of SPD(k)

n = length(new_x);
k = size(ref_vals,1);

D = -2;
DP =  2;
hold on; axis equal; axis off;
for j=1:n
    subplot(1,n,j)
    EllipseDraw(ref_vals(:,:,j));
    axis([D DP D DP D DP]);
    if ~isempty(find((x-new_x(j))==0,1))
         title('Data parametric place');    % this is a data-place
    end
end

end

