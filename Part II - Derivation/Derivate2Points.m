function G = Derivate2Points(X, Y)
  
  n=length(X);
  g = @(x) (Y(x)-Y(x-1))./(X(x)-X(x-1));
  G=g(2:n);

endfunction
