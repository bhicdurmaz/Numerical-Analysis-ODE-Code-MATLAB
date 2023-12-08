function [t,y] = euler(t0,y0,t_end,h,fcn) 
% function [t,y]=euler for(t0,y0,t end,h,fcn) %
% Solve the initial value problem
% y’ = f(t,y), t0 <= t <= b, y(t0)=y0
% Use Euler’s method with a stepsize of h. The user must
% supply a program to define the right side function

n = fix((t_end-t0)/h)+1;
t = linspace(t0,t0+(n-1)*h,n)'; 
y = zeros(n,1);
y(1) = y0;
  for i = 2:n
y(i) = y(i-1)+h*feval(fcn,t(i-1),y(i-1)); 
  end