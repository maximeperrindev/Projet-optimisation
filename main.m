%% Projet Optimisation
% Maxime Perrin & Yvan Enjolras
close all; 
clear all;

% Ouverture des donn�es avec x,y des matrices colonnes contenant les
% donn�es.
file = open('data.mat');

x = file.x;
y = file.y_noisy;

%% Estimation au sens des moindres carr�s.

dimension = 100;
spaceA = linspace(5, 10, dimension);
spaceB = linspace(-4, 0, dimension);
% On g�n�re 100 points entre nos bornes
a = spaceA;
b = spaceB;

%% Question 1:
moindresCarres = ones(dimension);

for i=1:dimension
  for j=1:dimension
    % On estime la valeur via les moindres carr�s pour chaque valeur de
    % data.mat
    moindresCarres(i,j) = MoindresCarres(a(i), b(j), x, y);
  end
end

figure(1);
contour(a,b,moindresCarres', 200); 
xlabel('a'); ylabel('b');
title('Moindres carr�s');
figure(2);
mesh(a,b,moindresCarres);

%% Question 2:
[mina, minb] = MatrixMin(a, b, moindresCarres)

figure;
contour(b, a, moindresCarres, 100); xlabel('b'); ylabel('a');
hold on;
plot(minb, mina, '*r');
hold off;
legend({'Moindres carr�s', 'Minimum'});
title('Moindres carr�s avec en son centre le minimum calcul� en a = 6.9697 et b = -2.4242');

figure;
plot(x,minb + x*mina,'-r');
hold on;
plot(x,y,'o');
hold off;
xlabel('a'); ylabel('b');
title('Moindres carr�es pour a = 6.9697 et b = -2.4242');
grid('on');
legend({'Moindre carr�s', 'Points'});

%% Question 3 :
% Creation de la nouvelle matrice.
xExtend = ones(size(x,1), 2);
xExtend(:, 1) = x;

% Calcul du r�sultat.
quad = inv(xExtend'*xExtend)*xExtend'*y;
aMinPrecis = quad(1,1)
bMinPrecis = quad(2,1)

%% Question 4:

figure(4);
contour(b, a, moindresCarres, 100); xlabel('b'); ylabel('a');
hold on;
plot(bMinPrecis, aMinPrecis, '*r');
hold off;
legend({'Moindres carr�s', 'Minimum pr�cis'});
title('Moindres carr�s avec en  son centre le minimum calcul� en a = 6.9485 et b = -2.3803');

%% Question 5:
figure(5);
plot(x, bMinPrecis + x * aMinPrecis, '-r');
hold on;
plot(x, minb + x * mina, '-b');
plot(x, y, 'o');
hold off;
xlabel('a'); ylabel('b');
legend({'Moindres carr�s plus pr�cis','Moindres carr�s moins pr�cis', 'Points'});
title('Repr�sentation de l''approximation des moindres carr�s');
%% Question 7
X = -10:0.1:10;
y1=(1/2) * log(1+X.^2); 
y2=X ./ (1+X.^2) ;
y3=(1-X.^2) ./ (1+X.^2).^2;
figure
plot(X, y1)
hold on
plot(X, y2)
plot(X, y3)
legend('fonction de p�nalisation','1ere d�riv�e','2ieme d�riv�e');
title('Fonction de p�nalisation');
hold off
grid on
%% Question 8
figure
spaceA=-15:0.1:25;
spaceB=-15:0.1:25;
[a,b] = meshgrid(spaceA,spaceB);
f = cout_robuste(a,b, x, y);
contour(a,b,f,100)
title('Fonction de co�t dans lespace des param�tres (a,b)')
%% Question 9
figure
spaceA=0:0.1:8;
spaceB=-5:0.1:3;
[a,b] = meshgrid(spaceA,spaceB);
f = cout_robuste(a,b, x, y);
contour(a,b,f,100)
[grad_A,grad_B] = gradient_cout_robuste(a, b, x, y);
hold on;
quiver(a,b,grad_A,grad_B)
axis equal
title('Gradient de la fonction de cout')
%% Question 10
% Configuration initiale
% alpha = 20;
% epsilon = 10^-6;
% a=20;
% b=20;
% [A,B]=plus_forte_pente(a,b,x,y,epsilon,alpha);
% spaceA=-15:0.1:25;
% spaceB=-15:0.1:25;
% [a,b] = meshgrid(spaceA,spaceB);
% f = robuste(a,b, x, y);
% figure(7) 
% contour(a,a,f,100)
% hold on;
% plot(A,B);
% title('M�thode de la plus forte pente sur la fonction de co�t');
% xlabel('point a');ylabel('point b');