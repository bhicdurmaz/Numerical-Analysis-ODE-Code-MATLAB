function myshooting_hw

%f---Verilen 2.mertebe diferansiyel denklemi 1.mertebe diferansiyel denklem
%sistemine dönüştürülmüş hali
f=@(t,y)[y(2);-2+4*(t^2)*(4-t^2)+2*t*y(1)*y(2)];

%init_1----Verilen sınır değer probleminin aralığın ilk noktasında verilen
%koşulu, bu değişmeyecek, y(x_0)
init_1=0;

%init_2_guess_1--Verilen 2.sınır değer koşul yerine verdiğimiz 1.tahmini
%başlangıç değer, y'(x_0)
init_2_guess(1)=1;
[x_values y_and_y_deriv]=ode45(f,[2,3],[init_1;init_2_guess(1)]);
%aralığın sonundaki x değerine karşılık olarak bulduğumuz y değeri,
% bunun soruda verilen 2.koşula eşit olması için çalışıyoruz
y_guess(1)=y_and_y_deriv(end,1)

%init_2_guess_2--Verilen 2.sınır değer koşul yerine verdiğimiz 2.tahmini
%başlangıç değer, y'(x_0)
init_2_guess(2)=2;
[x_values y_and_y_deriv]=ode45(f,[2,3],[init_1;init_2_guess(2)]);
%aralığın sonundaki x değerine karşılık olarak bulduğumuz y değeri,
% bunun soruda verilen 2.koşula eşit olması için çalışıyoruz
y_guess(2)=y_and_y_deriv(end,1)

for i=1:2;
%init_2_guess_3--Verilen 2.sınır değer koşul yerine kullanacağımız önceki 
%iki tahmini koşulun interpolasyonu ile elde ettiğimiz 3. tahmini başlangıç değer, y'(x_0)
init_2_guess(i+2)=init_2_guess(i+1)+(init_2_guess(i+1)-init_2_guess(i))*(-5-y_guess(i+1))/(y_guess(i+1)-y_guess(i));
[x_values y_and_y_deriv]=ode45(f,[2,3],[init_1;init_2_guess(i+1)]);
%aralığın sonundaki x değerine karşılık olarak bulduğumuz y değeri,
% bunun soruda verilen 2.koşula eşit olması için çalışıyoruz
y_and_y_deriv(:,1)
y_guess(i+2)=y_and_y_deriv(end,1)
abs(y_guess(i+1)-y_guess(i))
end;
figure;
y_yaklasik=y_and_y_deriv(:,1);
plot(x_values,y_yaklasik,'v')

figure;
N=size(x_values,1);
t=2:(1/N):3;
y_gercek=-t.^2+4;
plot(t,y_gercek,'*')