%chebfun.pdf pag. 15

function ex3_lab1

test = 2;
d = [-1, 1]; % INTERVALLO.

switch test
    case 1
        ff = @(x) abs(x-0.3);
    case 2
        ff = @(x) exp(x.^2);
    case 3
        ff = @(x) exp(x);
    case 4
        ff = @(x) sin(x);
    case 5
        ff = @(x) sinc(x);
end

f = chebfun(ff,d,'splitting','on');
for n = 10:10:50
  p = remez(f, n);
  fc = chebfun(ff, n+1);

  erem=norm(f-p, inf);
  echeb=norm(f-fc, inf);
  
  fprintf("%d:\n", n);
  fprintf('\n\t REMEZ: %1.5e',erem);
  fprintf('\n\t CHEBYSHEV: %1.5e',echeb);
  fprintf("\n\n");
end
