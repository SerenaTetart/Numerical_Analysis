function B = Cholesky(A)

  % A symmetric positive definite matrix
  % B upper triangular matrix
  % Compute B for A = BB'

  n = length(A);
  B(1, 1)=sqrt(A(1, 1));
  for i=2:n
    B(i,1)=A(i,1)/B(1,1);
  endfor
  for j=2:n
    B(j,j) = sqrt(A(j,j)-sum(B(j, 1:(j-1)).^2));
    for i=j:n
      B(i,j) = (1./B(j,j)).*(A(i,j)-sum(B(i, 1:j-1).*B(j, 1:j-1)));
    endfor
  endfor

endfunction
