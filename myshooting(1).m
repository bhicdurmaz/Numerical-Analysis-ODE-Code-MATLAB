function myshooting

%f---Verilen 2.mertebe diferansiyel denklemi 1.mertebe diferansiyel denklem
%sistemine dönüştürülmüş hali
f=@(x,y)[y(2);x+(1-x/5)*y(1)];

%init_1----Verilen sınır değer probleminin aralığın ilk noktasında verilen
%koşulu, bu değişmeyecek, y(x_0)
init_1=1;

%init_2_guess_1--Verilen 2.sınır değer koşul yerine verdiğimiz 1.tahmini
%başlangıç değer, y'(x_0)
init_2_guess_1=-1.5;
[x_values y_and_y_deriv]=ode45(f,[1,3],[init_1;init_2_guess_1]);
%aralığın sonundaki x değerine karşılık olarak bulduğumuz y değeri,
% bunun soruda verilen 2.koşula eşit olması için çalışıyoruz
y_guess_1=y_and_y_deriv(end,1)

%init_2_guess_2--Verilen 2.sınır değer koşul yerine verdiğimiz 2.tahmini
%başlangıç değer, y'(x_0)
init_2_guess_2=-3;
[x_values y_and_y_deriv]=ode45(f,[1,3],[init_1;init_2_guess_2]);
%aralığın sonundaki x değerine karşılık olarak bulduğumuz y değeri,
% bunun soruda verilen 2.koşula eşit olması için çalışıyoruz
y_guess_2=y_and_y_deriv(end,1)

%init_2_guess_3--Verilen 2.sınır değer koşul yerine kullanacağımız önceki 
%iki tahmini koşulun interpolasyonu ile elde ettiğimiz 3. tahmini başlangıç değer, y'(x_0)
init_2_guess_3=init_2_guess_2+(init_2_guess_2-init_2_guess_1)*(-1-y_guess_2)/(y_guess_2-y_guess_1);
[x_values y_and_y_deriv]=ode45(f,[1,3],[init_1;init_2_guess_3]);
%aralığın sonundaki x değerine karşılık olarak bulduğumuz y değeri,
% bunun soruda verilen 2.koşula eşit olması için çalışıyoruz
y_guess_3=y_and_y_deriv(end,1)

%t=1:.1:3;
%y_gercek=t.^2;

y_yaklasik=y_and_y_deriv(:,1);
plot(x_values,y_yaklasik)