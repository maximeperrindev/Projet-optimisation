close all; 
clear all;

file = open('data.mat');

x = file.x;
y = file.y_noisy;

%% Estimation au sens des moindres carrés.

dimension = 150;
space = [-25; 40];
a = linspace(space(1), space(2), dimension);
b = a;

%% Question 1:
moindresCarres = ones(dimension);

for i=1:dimension
  for j=1:dimension
    moindresCarres(i,j) = MoindresCarres(a(i), b(j), x, y);
  end
end

figure(1);
contour(a,b,moindresCarres); 
xlabel('b'); ylabel('a');
title('Moindres carrés');
figure(2);
mesh(a,b,moindresCarres);

