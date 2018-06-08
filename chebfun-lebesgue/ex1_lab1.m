%Ex1 from chebfun.pdf pag. 11
%smart version, using vector operations
format long e;

[eequi,echeb] = chebfun_test(1);
N=1:2:100;
E1=echeb(N);  %echeb[1:3:5:7:...]
E1a=E1(2:end);  %echeb[3:5:7:...]
E1b=E1(1:end-1); %echeb[1:3:5....]
gamma=sqrt(E1a ./ E1b);  %compute the ratio "e_n/e_n-2", then get the square root to get gamma
fprintf('GAMMAS:');
gamma

%get C from the last error (pos=100) and gamma^pos
C = echeb(end) / (gamma(end)^100);   %formula
fprintf("C is %e\n:", C);

%we could also write a less smart version with for loops
%L = length(echeb);
%for n=1:L-2
%   L1=echeb(n)
%   L2=echeb(n+2);
%   mygamma=sqrt(L2/L1);
%   fprintf('gamma: %1.15e', mygamma)
%end
