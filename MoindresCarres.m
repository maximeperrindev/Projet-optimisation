function [val] = MoindresCarres(a, b, x, y)
  % Initialisation
  val = 0;
  N = size(x, 1);
  % On effectue la m�thode des moindres carr�es pour chaque valeur de a et b sur
  % les �l�ments x et y. 
  for i=1:N
      val = val + (a*x(i) + b - y(i))^2;
  end
end
