%pag 8
function ex1_lab6
format long e;

fprintf("TEST JACOBI\n");
A = gallery('minij', 20);
b = ones(20, 1);
x = zeros(20, 1);
tol = 10^(-6); 
[x, error, iter, flag] = jacobi(A, x, b, 100, tol);
fprintf('COMPUTED SOLUTION');
x 
fprintf("ERROR: %e, ITER: %d, FLAG: %d\n\n", error, iter, flag);
%with 100 iteration it outputs flag = 1 and x includes very large numbers

%###################################

fprintf("TEST SOR\n");
w_vector = [0.01:0.01:1.99];      %test omegas
x = zeros(20, 1);
solutions = [];  %for each omega, stores the solution given by sor
errors = [];  %for each omega, stores the error
iter_numbers = []; %for each omega, stores the number of iterations performed by sor
best_omega = 0;  %omega that minimize the number of iterations
min_iter_number = 10000;

for i = 1:length(w_vector)
    [x, error, iter, flag] = sor(A, x, b, w_vector(i), 5000, tol);
    errors = [errors error];
    iter_numbers = [iter_numbers iter];
    if (iter < min_iter_number)
        min_iter_number = iter;
        if (flag == 0)
            best_omega = w_vector(i);
        end
    end
end

fprintf("BEST OMEGA IS: %e\n", best_omega);
semilogy(w_vector, iter_numbers);
title("Iteration numbers (log) against omegas");