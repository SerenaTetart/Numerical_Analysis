function [x, iter] = Jacobi(A, b, x0, eps, itmax)
  err = 1;
  x = x0;
  iter = 0;
  D= diag(diag(A));
  while(err > eps & iter < itmax)
    xk = x-D\A*x+D\b;
    err = norm(x-xk);
    x = xk;
    iter = iter+1;
  endwhile
endfunction