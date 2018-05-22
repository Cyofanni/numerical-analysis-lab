function [t,y,flag]=eulero_implicito(t0, y0, t_end, h, fcn, tol)
flag=0;

max_count=100;

n = fix((t_end-t0)/h) + 1;  %n: number of subintervals
t = linspace(t0, t0+(n-1)*h, n)'; %vector of samples on the x axis
y = zeros(n,1);  %will contain the approximations
y(1) = y0;

for i = 2:n 
  yt1 = y(i-1) + h*feval(fcn, t(i-1), y(i-1)); %initial value given by explicit euler
  count = 0;  diff = 1;
  while diff(end) > tol && count < max_count %fixed-point method
    yt2 = y(i-1) + h*feval(fcn,t(i),yt1);  %implicit euler formula
    diff(count+1) = abs(yt2-yt1); 
    yt1 = yt2;
    count = count +1;
  end
  
  if count >= max_count
      flag=1;
  end
  y(i) = yt2;  %put the solution of the non-linear equation in the y vector
end