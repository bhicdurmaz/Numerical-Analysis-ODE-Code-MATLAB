function err=fin_dif(N)
h=1/N;
a=1/(h^2)+3/(2*h);
b=1-2/(h^2);
c=1/(h^2)-3/(2*h);
A=zeros(N+1,N+1);
b_vect=zeros(N+1,1);

for i=2:N;
    x=(i-1)*h;
    A(i,i)=b;
    A(i,i-1)=c;
    A(i,i+1)=a;
    b_vect(i)=2-sin(pi*x)*pi^2+3*(2*x+pi*cos(pi*x))+x^2+sin(pi*x);
end;
A(1,1)=1;
A(N+1,N+1)=1;
b_vect(1)=0;
b_vect(N+1)=1;
y_appr=A\b_vect;
t=0:h:1;
y_exact=t.^2+sin(pi*t);
y_exact=y_exact';
err=sqrt(sum((y_appr-y_exact).^2));

