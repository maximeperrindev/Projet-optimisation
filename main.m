close all; 
clear all;

% Ouverture des donn�es avec x,y des matrices colonnes contenant les
% donn�es.
file = open('data.mat');

x = file.x;
y = file.y_noisy;

%% Estimation au sens des moindres carr�s.

dimension = 150;
space = [-20; 40];

% On g�n�re 150 points entre nos bornes [-25; 40].
a = linspace(space(1), space(2), dimension);
b = a;

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
contour(a,b,moindresCarres); 
xlabel('b'); ylabel('a');
title('Moindres carr�s');
figure(2);
mesh(a,b,moindresCarres);

%% Question 2:
% TODO : get Min of Matrix
aMin = pointMoindreCarrees(1)
bMin = pointMoindreCarrees(2)

