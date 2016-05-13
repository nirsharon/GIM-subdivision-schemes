function [ new_x, ref_vals ] = GIM_Subdivision(x, vals, refine_func, avg_func, iter, additional_parameter)
%
%-----------------------------------------------------------------
% Main function of binary subdivision schemes that generates the refined data.
%
% Input:
%   x           - vector of parametric values, equilly spaced. 
%                 Traditionally it is on the integers
%   vals        - sampled values, 3D array (d X d X length(x)) of matrices.  
%   refine_func - the specific function of refinement, e.g, 4pt refinement 
%   avg_func    - the (geodesic) average in use for the specific data
%                 values
%   iter        - how many refinements. Typically \inf==5
%   additional_parameter - if needed. e.g., w in the 4pt.
%
% Output:
% 
%-----------------------------------------------------------------
% ABSTRACT
%  related to the paper : 
%    Manifold-valued subdivision schemes based on geodesic inductive
%    averaging by Nira dyn and Nir Sharon
%-----------------------------------------------------------------
% NS, May 2016
%-----------------------------------------------------------------

p_flag = 1;
if nargin<6
    p_flag = 0;   % no added parameters
end

current_val = vals;
current_x   = x   ;

for k=1:iter
    if p_flag
        [current_x, current_val] = refine_func(current_x, current_val,avg_func,additional_parameter);
    else
        [current_x, current_val] = refine_func(current_x, current_val,avg_func);
    end
end
   
new_x = current_x;
ref_vals = current_val;
end