function [T Y]=euler_system
%h=0.2
fcn=@(t,y) (y+t.^2-2)./(t+1);
T=zeros(26,5);
Y=zeros(26,5);
for i=1:5;

[T(1:i*5+1,i) Y(1:i*5+1,i)] =euler(0,2,i,0.2,fcn);

end;

