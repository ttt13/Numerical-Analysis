N = 20;
h = (2*pi)/N;

testv = ones(4, 1);
diagonal = ones(N,1);
zerov = zeros(N,1);
% Create B Matrix
trib = [-1*diagonal, zerov, (diagonal)];
B = full(spdiags(trib, [0, 1, 2], N-1, N+1));

% Create A matrix
diagonal2s = -2*diagonal;
tridiagonal = [diagonal, diagonal2s, diagonal];
A = full(spdiags(tridiagonal, [0, 1, 2], N-1, N+1));

% Equation
test = ( ( ((N^2)/(4*(pi^2)))*A ) + ( (N/(8*pi))*B ) );
nodez = 0+h:h:(2*pi)-h;
y = sin(nodez);
nodez = nodez';
y = y';
why = test\y;

% Plotting
grid = 0:0.01:2*pi;
plot(grid, 0.4*(1-cos(grid))-0.8*sin(grid), 'LineWidth', 1);
hold on;
plot(0:h:2*pi, why, '*', 'Color', 'r');

spy(A);
spy(B);