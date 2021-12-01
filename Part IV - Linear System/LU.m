function [L, U] = LU(A)
  
  % L lower triangular matrix | U upper triangular matrix
  % Compute L and U with A = LU
  
  n = length(A);
  Ai = A; E = [];
  for i = 1:n
    Ei = eye(n);
    X = -Ai(1:n, i)/Ai(i, i);
    Ei(i+1:n, i) = X(i+1:n);
    E = [E Ei];
    Ai = Ei*Ai;
  endfor
  
  L = eye(n);
  for i = n-1:-1:1
    L = L*E(1:n, 1+(n*(i-1)):n*i);
  endfor
  L = inv(L);
  U = Ai;

endfunction
