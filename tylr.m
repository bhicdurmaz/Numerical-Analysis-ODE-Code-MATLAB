function tylr(n);
b=3;
a=0;

y0=1;
y1=-1/2;
y2=3/4;
y3=-3/8;
y4=3/16;

h=(b-a)/n;

x=a:h:b;

y=y0+y1*x+y2*x.^2/factorial(2)+y3*x.^3/factorial(3)+y4*x.^4/factorial(4);

plot(x,y)

y_ex=x-2+3*exp(-x./2);

err=sqrt(sum((y-y_ex).^2));

y(2)-y_ex(2)