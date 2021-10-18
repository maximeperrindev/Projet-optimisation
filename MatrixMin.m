function [minA,minB] = MatrixMin(a,b,matrix)
  [l,L] = size(matrix);
  minM = [1,1];
  for i=1:l
      for j=1:L
          if matrix(i,j) < matrix(minM(1), minM(2))
              minM = [i, j];
          end
      end
  end
  minA = a(minM(1));
  minB = b(minM(2));
end
