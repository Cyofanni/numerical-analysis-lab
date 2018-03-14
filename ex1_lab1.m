%Ex1 from chebfun.pdf
%smart version, using vector operations
[eequi,echeb] = chebfun_test;
N=1:2:100;
E1=echeb(N);
E1a=E1(2:end);
E1b=E1(1:end-1);
gamma=sqrt(E1a ./ E1b);

gamma


%we could also write a less smart version with for loops
%L = length(echeb);
%for n=1:L-2
%   L1=echeb(n)
%   L2=echeb(n+2);
%   mygamma=sqrt(L2/L1);
%   fprintf('gamma: %1.15e', mygamma)
%end
