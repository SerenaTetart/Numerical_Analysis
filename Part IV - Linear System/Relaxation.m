function [x, iter] = Relaxation(A, b, x0, w, eps, itmax)
  err = 1;
  x = x0;
  iter = 0;
  J =(1/w)*diag(diag(A))+tril(A, -1);
  while(err > eps & iter < itmax)
    xk = x-J\A*x+J\b;
    err = norm(x-xk);
    x = xk;
    iter = iter+1;
  endwhile
endfunction
