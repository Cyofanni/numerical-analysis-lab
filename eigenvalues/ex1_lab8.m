format long;

A = hilb(5);

z0 = [1, 1, 1, 1, 1];
toll = 10^(-8);
nmax = 100;
mu = 0;

[lambda_max_vector, x1, niter, err] = metodo_potenze(A, z0', toll, nmax);
[lambda_min_vector, x, niter, err] = metodo_potenze_inverse(A, z0', mu, toll, nmax);
lambda_max = lambda_max_vector(end);
fprintf('LAMBDA MAX OF MATRIX A [POWER METHOD]: %.15e\n', lambda_max);
lambda_min = lambda_min_vector(end);
fprintf('LAMBDA MIN OF MATRIX A [POWER METHOD]: %.15e\n\n', lambda_min);

%############################################
K = cond(A, 2);
fprintf('CONDITIONING OF A (from "cond"): %e\n', K);
%determine the condition number from the found eigenvalues
fprintf('CONDITIONING OF A (from the eigenvalues): %e\n\n', lambda_max/lambda_min);


%############################################
%now use the QR method to solve the same problem
[H, Q] = houshess(A);
[T, hist] = metodo_QR(H, 100);
fprintf('LAMBDA MAX OF MATRIX A [QR METHOD]: %.15e\n', max(diag(T)));  %from the diagonal
fprintf('LAMBDA MIN OF MATRIX A [QR METHOD]: %.15e\n\n', min(diag(T))); %from the diagonal
