function alpha = fletcher_lemarechal (x,y,a,b,d,alpha_0)

% Configuration initiale
lambda = 20;
beta1 = 0.001; 
beta2 = 0.99;
k = 0;
alpha_l = 0;
alpha_r = Inf;
continuer=true;
limit=500;
alpha=alpha_0;

%Pour cout de moindres carrés
% grad=grad_cout_moindres_carres(a, b, x, y);
% f = cout_moindres_carres(a, b, x, y);

grad = gradient_cout_robuste(a, b, x, y);
f = cout_robuste(a,b,x,y);

%Condition pour avoir une direction de descente
deriv=grad'*d;
if (deriv>=0)
    error("d n'est pas une direction de descente")
end

%calcul de gamma
gamma = -beta1.*deriv;

while ((continuer == true)&&(k < limit))
    % Pour moindres carrés
    % f_new = cout_moindres_carres(a+alpha*d(1), b+alpha*d(2), x, y);
    % grad_new = grad_cout_moindres_carres(a+alpha*d(1), b+alpha*d(2), x, y);
    
    grad_new = gradient_cout_robuste(a+alpha*d(1), b+alpha*d(2), x, y);
    f_new = cout_robuste(a+alpha*d(1), b+alpha*d(2), x, y);

    
    % Première condition de Wolf
    % CW1
    if (f_new <= f - alpha*gamma)
        CW1 = true;
    else
        CW1 = false;
    end

    % Deuxième condition de Wolf
    % CW2
    if (((grad_new'*d)/deriv)<=beta2)
        CW2=true;
    else
        CW2=false;
    end

    %On vérifie CW1 et CW2
    if((CW1 == true) && (CW2 == true))
        %on stoppe le programme
        continuer = false;
    else
        %on continue
        k = k + 1;
        %viole CW1
        if (CW1 == false)
             alpha_r = alpha;
            alpha = (alpha_l + alpha_r) / 2;
        else
            alpha_l = alpha;
            if (alpha_r <inf)
                alpha = (alpha_l + alpha_r) / 2;
            else 
                alpha=lambda * alpha;
            end
        end
    end
end
end
