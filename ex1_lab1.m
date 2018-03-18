%Ex1 from chebfun.pdf
%smart version, using vector operations

function ex1_lab1

[eequi,echeb] = chebfun_test(6); %choose function by passing input
N=1:2:100;
E1=echeb(N);
E1a=E1(2:end);
E1b=E1(1:end-1);
gamma=sqrt(E1a ./ E1b);
gamma

fprintf("THE GAMMA VECTOR IS:\n");
gamma
gamma_raised = gamma.^[3:2:100]
C=E1a./(gamma_raised);
fprintf("THE C VECTOR IS:\n");
C

x = [2:49];
y1 = E1(x);
y2 = C(x).*gamma_raised(x);
hold on;
plot(x, y1, 'r-');
plot(x, y2, 'k*');
title('Comparing error against C-gamma product')
hold off




%we could also write a less smart version with for loops
%L = length(echeb);
%for n=1:L-2
%   L1=echeb(n)
%   L2=echeb(n+2);
%   mygamma=sqrt(L2/L1);
%   fprintf('gamma: %1.15e', mygamma)
%end
