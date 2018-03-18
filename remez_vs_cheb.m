%Ex. 3 < chebfun.pfd
function [erem,echeb]=remez_vs_cheb

d = [-1, 1]; % INTERVAL.
example = 6;

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
f=chebfun(ff,d, 'splitting', 'on');
erem=[];    %remez errors
echeb=[];   
nn=10:10:50;  %remez degree

for n=nn
    p = remez(f, n);
    fc = chebfun(ff, n+1);
    erem = [erem norm(f-p, inf)];
    echeb = [echeb norm(f-fc, inf)];
end
    
clf;
hold on;
semilogy(nn,erem,'k-');
%pause;
semilogy(nn,echeb,'r-');
hold off;