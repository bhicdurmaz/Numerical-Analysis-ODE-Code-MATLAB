[t,y] = meshgrid(-1:0.2:1,1:0.5:4); dt = ones(7,11);dy = 2*t.*y.^2; quiver(t,y,dt,dy);
hold on
tt = -0.87:0.01:0.87;
yy = 1./(1-tt.^2);
  plot(tt,yy)
  hold off