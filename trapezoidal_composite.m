function [x,w]=trapezoidal_composite(N,a,b)
% COMPOSITE TRAPEZOIDAL RULE.
% INPUT:
% N: NUMBER OF SUBINTERVALS.
% a, b: INTEGRATION EXTREMES.
% OUTPUT:
% x: INTEGRATION NODES.
% w: INTEGRATION WEIGHTS (INCLUDING THE STEP!).
h=(b-a)/N;             % INTEGRATION STEP.
x=a:h:b; x=x';         % INTEGRATION NODES.
w=ones(N+1,1);         % INTEGRATION WEIGHTS.
w(1)=0.5; w(N+1)=0.5;
w=w*h;
