function [  ] = Show_axes_plot(AxesVectors, CenterPoint, IsData )
% Draw three axes and their center point in case of data value
% (interpolation) or general parametric place of data (approximation)
%
% NS, May 2016

quiver3( CenterPoint(1),   CenterPoint(2),   CenterPoint(3), ...
    AxesVectors(1,1), AxesVectors(2,1), AxesVectors(3,1), 0, 'color', [.9 0 0]);
quiver3( CenterPoint(1),   CenterPoint(2),   CenterPoint(3), ...
    AxesVectors(1,2), AxesVectors(2,2), AxesVectors(3,2), 0, 'color', [0 .9 0]);
quiver3( CenterPoint(1),   CenterPoint(2),   CenterPoint(3), ...
    AxesVectors(1,3), AxesVectors(2,3), AxesVectors(3,3), 0, 'color', [0 0 .9]);

if IsData
    scatter3(CenterPoint(1), CenterPoint(2), CenterPoint(3),'k','filled')
end

end

