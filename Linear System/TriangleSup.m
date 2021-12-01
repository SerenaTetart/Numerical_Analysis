function X = TriangleSup(A, b)
  
  n = length(A);
  X=b;
  X(n) = b(n)./A(n, n);
  for i = n-1:-1:1
    X(i) = (b(i) - A(i, i+1:n)*X(i+1:n))./A(i,i);
  endfor

endfunction