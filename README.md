# Numerical-Analysis
Finite precision computations 

# Ca2: Gaussian Elimination on large matrices
Create tridiagonal matrices of size N by N.
Investigate the growth of error due to finite-precision computation with Gaussian Elimination using MATLAB's backslash command.
Investigate the size of the N by N matrix at which the mean error for Gaussian Elimination is 1. 

# Ca3: Ill conditioned linear systems: Hilbert Matrix
Objective: Investigate performance of different methods of solving linear systems when matrix is ill-conditioned. We do this by generating hibert matrices of size N. Solve the matrices using different methods: LU factorization, QR factorization, and MATLAB's backslash. Anticipated theoretical growth is O( ((1+sqrt(2))^(4n))/sqrt(n) ).

# Ca4: Finding zeros of Bessel functions
The Bessel function Y_0(x) has and infinite number of zeroes in the range 0 < x < inf. We write these zeroes as 0 < x1 < x2 < ... < inf. We wish to use the bisection method to compute the first M zeroes. 

# Ca5: Polynomial interpolation, node distribution
Examine how the locations of nodes x0, x1, ..., xn affect the accuracy of polynomial interpolation. First, consider equally spaced nodes on [ -1, 1]. Next, try Chebyshev nodes. Test the interpolation vs. the actual function f(x) = cos(10^4x). 

# Ca6: Finite difference method

# Ca7: Trapezoidal rule

# Ca8: Numerical Solution of Kepler's Problem
