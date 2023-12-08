function myshooting
f=@(x,y)[y(2);x+(1-x/5)*y(1)];

init_1=2;
init_2_guess_1=-1.5;
[x_values y_and_y_deriv]=ode45(f,[1,3],[init_1;init_2_guess_1]);
y_guess_1=y_and_y_deriv(end,1);

init_1=2;
init_2_guess_2=-3;
[x_values y_and_y_deriv]=ode45(f,[1,3],[init_1;init_2_guess_2]);
y_guess_2=y_and_y_deriv(end,1);

init_1=2;
init_2_guess_3=init_2_guess_2+(init_2_guess_2-init_2_guess_1)*(-1-y_guess_2)/(y_guess_2-y_guess_1);
[x_values y_and_y_deriv]=ode45(f,[1,3],[init_1;init_2_guess_3]);
y_guess_3=y_and_y_deriv(end,1)

