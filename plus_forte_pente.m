function [A,B] = plus_forte_pente(a,b,x,y,epsilon,alpha)
k = 0;
iterationMax = 500;
A = a;
B = b;

grad = gradient_cout_robuste(a,b,x,y);
while (k < iterationMax) && (norm(grad) > epsilon)
    % on calcule dk
    gradk = gradient_cout_robuste(a,b,x,y);
    dk = -gradk;
    
    % on trouve alphak via l'algorithme fletcher lemaréchal que nous avons
    % fait pour la question 6
    alphak = fletcher_lemarechal(x, y, a, b, dk, alpha);

    % on calcule xk+1
    a = a + alphak*dk(1);
    b = b + alphak*dk(2);
    k = k + 1;
    A=[A,a];
    B=[B,b];
end
end