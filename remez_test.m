
function [eequi,echeb]=remez_test

d = [-1, 1]; % INTERVAL.
ff = @(x) 1./(1+25*x.^2);
f=chebfun(ff,d,'splitting','on');
n=10;
p = remez(f,n); % BEST APPROX DEGREE n
fc = chebfun(ff, n+1); % INTP. CHEB.

erem=norm(f-p,inf);
echeb=norm(f-fc,inf);

fprintf('\n\t REMEZ: %1.5e',erem);
fprintf('\n\t CHEBYSHEV: %1.5e',echeb);
fprintf('\n')
