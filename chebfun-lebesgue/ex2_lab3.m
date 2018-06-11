%costante_lebesgue.pdf ex. 2
function ex2_lab3

%each one store a sequence of lebesgue constants for an n
lambdas_1 = [];  %equispaced
lambdas_2 = [];  %chebyshev
lambdas_3 = [];
lambdas_4 = [];
GAMMA = 0.57721566490153286;


for n = 10:10:500
   lambdas_1 = [lambdas_1  2^(n+1) / exp(1)*n*log(n)];
   lambdas_2 = [lambdas_2  (2/pi)*(log(n+1) + GAMMA + log(8/pi))];
   lambdas_3 = [lambdas_3  (2/pi)*(log(n+1) + GAMMA + log(8/pi) - 2/3)];
   lambdas_4 = [lambdas_4  (2/pi)*(log(n+1) + GAMMA + log(4/pi))];
end

clf;
hold on;
semilogy(10:10:500, lambdas_1, 'r-');
hold on;
semilogy(10:10:500, lambdas_2, 'b-');
hold on;
semilogy(10:10:500, lambdas_3, 'k-');
hold on;
semilogy(10:10:500, lambdas_4, 'c-');
legend('equisp', 'gauss-cheb', 'ext-cheb', 'opt-conf');
title("Lebesgue constants' growth")
%hold off;


