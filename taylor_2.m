% Taylor's method of order 2  
 % Example 1:  Approximate the solution to the initial-value problem
 % dy/dt=e^t ; 0<=t<=2 ; y(0)=1;
 
 % Example 2:  Approximate the solution to the initial-value problem
 % dy/dt=y-t^2+1 ; 0<=t<=2 ; y(0)=0.5;

  %f = @(t,y) (0*y+exp(t));
  %fprime = @(t,y) (0*y+exp(t));   % f=e^t, f'=e^t
  
  f = @(t,y) (y-t^2+1);    
  fprime=@(t,y) (y-t^2+1-2*t);    % y'=f=y-t^2+1, f'=y'-2t+0 =y-t^2+1-2t
 a = input('Enter left end ponit, a:  ');
 b = input('Enter right end point, b:  ');
 n = input('Enter no. of subintervals, n: ');                
 alpha = input('Enter the initial condition, alpha:  ');
 
 h = (b-a)/n;                                                
 t=[a zeros(1,n)]; 
 w=[alpha zeros(1,n)];

 
 for i = 1:n+1 
 t(i+1)=t(i)+h;
 wprime=f(t(i),w(i))+(h/2)*fprime(t(i),w(i));
 w(i+1)=w(i)+h*wprime;
 fprintf('%5.4f  %11.8f\n', t(i), w(i));
 plot(t(i),w(i),'r*'); grid on; 
 xlabel('t values'); ylabel('w values');
 hold on;
 end