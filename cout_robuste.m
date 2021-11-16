function [res] = cout_robuste(a,b,X,Y)
    res=0;
    n=size(X);
    for i=1:n
        res = res + 0.5*log(1 + ((a*X(i) + b - Y(i)).^2)*(1/1^2));
    end
end

