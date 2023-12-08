[t,y] = meshgrid(-2:0.5:2,-2:0.5:2);
dt = ones(9);
dy = y; quiver(t,y,dt,dy);
hold on;
t = -2:0.01:1;
y1 = exp(t);y2 = -exp(t); plot(t,y1,t,y2) 
text(1.1,2.8,'\itY=e^t','FontSize',14)
text(1.1,-2.8,'\itY=-e^t','FontSize',14) 
hold off
