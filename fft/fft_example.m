function fft_example
N = 16;
f = inline('exp(-i*x) + exp(7*i*x) + sin(x)');
sigma = fft_coeffs(f, N);

for ii = 1:length(sigma)
    fprintf('\n \t ii: %3.0f sigma(ii): (%1.15e, %1.15e *i)', ii, real(sigma(ii)), imag(sigma(ii)))
end

x = (0:0.01:2*pi);
fx = f(x);
tx = fft_eval(sigma, x);

err = norm(fx - tx, inf);
fprintf('\n \n \t [err, inf norm]: %2.2e', err);
fprintf('\n \n');
