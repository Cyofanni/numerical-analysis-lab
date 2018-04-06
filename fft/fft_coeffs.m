function sigma = fft_coefs(f, N)
n = (1:N)';
X = (1/N)*f(2*(n-1)*pi/N);
sigma = fft(X);