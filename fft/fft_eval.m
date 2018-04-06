function y = fft_eval(sigma, x)
if size(x,1) == 1
    x = x';
end
if size(sigma, 1) == 1
    sigma = sigma';
end

N = length(sigma);
M = floor(N/2);
k = (M - N + 1):M;
V = exp(i*x*k);
tpos = sigma(1:M+1, 1);
tneg = sigma(M+2:end, 1);
t = [tneg; tpos];
y = V*t;