function [x, iter] = GaussSeidel(A, b, x0, eps, itmax)
  err = 1;
  x = x0;
  iter = 0;
  J = tril(A);
  while(err > eps && iter < itmax)
    xk = x-J\A*x+J\b;
    err = norm(x-xk);
    x = xk;
    iter = iter+1;
  endwhile
endfunction
