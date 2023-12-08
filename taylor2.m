function t = taylor (n , a , b)

liste_1=[]; % x değerleri   
liste_2=[];  % f in x noktalarındaki gerçek değerleri
liste_3=[];  % f in x noktalarındaki yaklaşık değeri
liste_4=[];   % mutlak hata değerleri
liste_5=[];  % mutlak hatanın karesi
h=(b-a)/(n-1);
f=@(x) 1/(x.^2+1);  % gerçek y 
f1=@ (x) -2.*x.*(f(x).^2);     % f 
f2=@(x) -2.*(f(x).^2)-4.*x.*f(x).*(f1(x)) ; % f in 1. türevi
fprintf('   iter             x        Gercek degeri       yaklasik degeri           mutlak hata');
for x=a:h:b
    liste_1=[liste_1 x] ;
    liste_2=[liste_2 f(x)];

end
for i=0:(n-1)
    f3=@(i) f(a)+(i.*h).*(f1(a))+(((i.*h).^2)/2).*f2(a);
    liste_3=[liste_3 f3(i)];
    mutlak_hata=abs(liste_3(i+1)-liste_2(i+1));
    liste_4=[liste_4 mutlak_hata];
    liste_5=[liste_5 liste_4(i+1).^2];
    fprintf('\n %7.4f        %7.4f       %7.4f              %7.4f                   %7.4f\n' ,i,liste_1(i+1),liste_2(i+1),liste_3(i+1),mutlak_hata);
    
end
max_hata=max(liste_4)
L_1_hatasi=sum(liste_4)
L_2_hatasi=(sum(liste_5)).^0.5