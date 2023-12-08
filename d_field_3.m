[t,y] = meshgrid(-1:0.2:1,1:0.5:4); dt = ones(7,11);dy = -y+sin(t)+cos(t); quiver(t,y,dt,dy);
hold on
tt = -0.87:0.01:0.87;
yy =sin(tt)+exp(-tt);
  plot(tt,yy)
  hold off