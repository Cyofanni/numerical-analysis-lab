%chebfun.pdf pag. 12

function ex2_lab1

test=5;
d = [-1, 1]; % INTERVALLO.

switch test
    case 1
        ff = @(x) abs(x-0.3); % FZ. CONTINUA
    case 2
        ff = @(x) exp(x.^2); % FZ. ANALITICA
    case 3
        ff = @(x) exp(x); % FZ. ANALITICA
    case 4
        ff = @(x) sin(x); % FZ. ANALITICA
    case 5
        ff = @(x) sinc(x); % FZ. sinc
end

f = chebfun(ff, d, 'splitting', 'on');   %splitting on needed for abs(x-0.3)
%eequi=[];
echeb=[];
nn=1:1:100;
for n=nn
    x = linspace(d(1), d(2), n+1);
    %p = chebfun.interp1(x, ff(x));
    fc = chebfun(ff, n+1);
    %eequi=[eequi norm(f-p,inf)];
    echeb=[echeb norm(f-fc,inf)];
end

clf;
%semilogy(nn,eequi,'r-');
%pause;
semilogy(nn, echeb, 'r-');
title("Error against number of nodes")
%LOW ERRORS BEYOND 20 NODES
