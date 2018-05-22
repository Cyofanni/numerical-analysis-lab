function [t, y] = eulero_esplicito(t0, y0, t_end, h, fcn)

%n: number of subintervals
n = fix((t_end-t0)/h)+1;  %rounds each element towards zero
t = linspace(t0,t0+(n-1)*h,n)';
y = zeros(n,1);
y(1) = y0;
for i = 2:n
  y(i) = y(i-1) + h*feval(fcn,t(i-1),y(i-1));
end