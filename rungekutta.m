function [T , Y] = rungekutta(f,tspan,y0,n);
a = tspan(1); b = tspan(2);
h = (b-a)/n;
t = a; T = a;
y = y0; 
Y = y0';
for i = 1:n
        k1 = f(t,y);      
        k2 = f(t+(3/4)*h,y+(3/4)*h*k1); 
        y = y +(1/3)*h*k1+(2/3)*h*k2;
        t = a + i*h;        
        T = [T; t];        
        Y = [Y; y'];
end
end