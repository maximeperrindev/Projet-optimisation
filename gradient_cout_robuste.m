function [grad_a,grad_b] = gradient_cout_robuste(a,b,X,Y)
  n=size(X);
  grad_a=0;
  grad_b=0;
  for i= 1 : n
    num = 1+(a.*X(i)+b-Y(i)).^2;
    grad_a = grad_a + (X(i).*X(i).*a+X(i).*b-Y(i).*X(i))./num;
    grad_b = grad_b + (b+a.*X(i)-Y(i))./num;
  end
end