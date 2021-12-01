function X = Resolution(A, b)

#Solve the linear equation Ax = b for a triangular matrix
  
  n = length(A);
  X=b;
  if(A == triu(A))
    X(n) = b(n)./A(n, n);
    for i = n-1:-1:1
      X(i) = (b(i) - A(i, i+1:n)*X(i+1:n))./A(i,i);
    endfor
  elseif(A == tril(A))
    X(1) = b(1)./A(1, 1);
    for i = 2:n
      X(i) = (b(i) - A(i, 1:i-1)*X(1:i-1))./A(i,i);
    endfor
  endif

endfunction
