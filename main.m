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
% TODO : get Min of Matrix
[mina, minb] = MatrixMin(a, b, moindresCarres)
