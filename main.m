close all; 
clear all;

% Ouverture des données avec x,y des matrices colonnes contenant les
% données.
file = open('data.mat');

x = file.x;
y = file.y_noisy;

%% Estimation au sens des moindres carrés.

dimension = 100;
spaceA = linspace(5, 10, dimension);
spaceB = linspace(-4, 0, dimension);
% On génère 100 points entre nos bornes
a = spaceA;
b = spaceB;

%% Question 1:
moindresCarres = ones(dimension);

for i=1:dimension
  for j=1:dimension
    % On estime la valeur via les moindres carrés pour chaque valeur de
    % data.mat
    moindresCarres(i,j) = MoindresCarres(a(i), b(j), x, y);
  end
end

figure(1);
contour(a,b,moindresCarres', 200); 
xlabel('a'); ylabel('b');
title('Moindres carrés');
figure(2);
mesh(a,b,moindresCarres);

%% Question 2:
[mina, minb] = MatrixMin(a, b, moindresCarres)

figure;
contour(a, b, moindresCarres, 100); xlabel('b'); ylabel('a');
hold on;
plot(minb, mina, '*r');
hold off;
legend({'Moindres carrés', 'Minimum'});
title('Moindres carrés avec en  son centre le minimum calculé en a = 6.9 et b = -2.4');

figure(3);
plot(x,minb + x*mina,'-r');
hold on;
plot(x,y,'o');
hold off;
xlabel('a'); ylabel('b');
title('Moindres carrées pour a = 6.9 et b = -2.4');
grid('on');
legend({'Moindre carrés', 'Points'});

%% Question 3 :
% Creation de la nouvelle matrice.
xExtend = ones(size(x,1), 2);
xExtend(:, 1) = x;

% Calcul du résultat.
quad = inv(xExtend'*xExtend)*xExtend'*y;
aMinBetterAccuracy = quad(1,1)
bMinBetterAccuracy = quad(2,1)
