# GIM-subdivision-schemes
Demos of GIM subdivision schemes in Matlab, following the paper "Manifold-valued subdivision schemes based on geodesic inductive averaging", by Nira Dyn and Nir Sharon.

The data consists of matrices one of the three classes: SPD, SE, SO. Two algorithms are implemented, the 4pt-scheme and cubic B-spline.

The main subdivision file is "GIM_Subdivision".
To run example of SE data and the 4pt-scheme use (under "tests" folder) "test_GIM_4pt_SE_matrices".
To run example of SO data and the cubic B-spline scheme use (under "tests" folder) "test_GIM_CubicBspline_refinement".
To run either 4pt or cubic algorithms with SPD data use (under "tests" folder) "test_GIM_4pt_positive_matrices". 
The file "test_GIM_element_wise" is to run the algorithm for scalars/vectors.
