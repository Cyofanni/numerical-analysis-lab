function [x,w]=simpson_composite(N,a,b)
% COMPOSITE SIMPSON RULE.
% INPUT:
% N: NUMBER OF SUBINTERVALS.
% a, b: INTEGRATION EXTREMES.
% OUTPUT:
% x: INTEGRATION NODES.
% w: INTEGRATION WEIGHTS (INCLUDING THE STEP!).
h=(b-a)/N;             
x=a:(h/2):b; x=x';
w=ones(2*N+1,1);
w(3:2:2*N-1,1)=2*ones(length(3:2:2*N-1),1);
w(2:2:2*N,1)=4*ones(length(2:2:2*N),1);
w=w*h/6;
