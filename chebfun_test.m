
function [eequi,echeb]=chebfun_test

example=1;
d = [-1, 1]; % INTERVAL.

switch example
    case 1
        ff = @(x) 1./(1+25*x.^2); %RUNGE FUNCTION
    case 2
        ff = @(x) abs(x-0.3); %CONTINUOUS FUNCTION
    case 3
        ff = @(x) exp(x.^2); %ANALYTIC FUNCTION
    case 4
        ff = @(x) exp(x); %ANALYTIC FUNCTION
    case 5
        ff = @(x) sin(x); % ANALYTIC FUNCTION
    case 6
        ff = @(x) sinc(x); % sinc function
end
f=chebfun(ff,d,'splitting','on');
eequi=[];
echeb=[];
nn=1:1:100;
for n=nn
    x = linspace(d(1), d(2), n+1);
    p = chebfun.interp1(x, ff(x));
    fc = chebfun(ff, n+1);
    eequi=[eequi norm(f-p,inf)];
    echeb=[echeb norm(f-fc,inf)];
end

clf;
semilogy(nn,eequi,'r-');
pause;
semilogy(nn,echeb,'r-');
