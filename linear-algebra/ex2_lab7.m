%pag 28
function ex2_lab7

format long e;

P_20 = gallery('poisson', 20);   %20^2 * 20^2 matrix
b = ones(400, 1);
x = zeros(400, 1);
tol = 10^(-12);
max_it = 50;
M = eye(size(P_20));

%TEST CONJUGATE GRADIENT METHOD
[x, error, iter, flag] = cg(P_20, x, b, M, max_it, tol);
fprintf("(C.G. METHOD) NUMBER OF ITERATIONS: %d, FLAG: %d\n", iter, flag);
%RESULTS: FLAG = 0 (it converges) in 43 iterations



%TEST JACOBI METHOD
max_it = 3000;
x = zeros(400, 1);
[x, error, iter, flag] = jacobi(P_20, x, b, max_it, tol);
fprintf("(JACOBI METHOD) NUMBER OF ITERATIONS: %d, FLAG: %d\n", iter, flag);
%RESULTS: FLAG = 0 (it converges) in 2061 iterations


%TEST GAUSS-SEIDEL METHOD
max_it = 2000;
x = zeros(400, 1);
[x, error, iter, flag] = sor(P_20, x, b, 1, max_it, tol);
fprintf("(GAUSS-SEIDEL METHOD) NUMBER OF ITERATIONS: %d, FLAG: %d\n", iter, flag);
%RESULTS: FLAG = 0 (it converges) in 1062 iterations
