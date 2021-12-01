function G = Derivate2(X, Y)
  
  n=length(X);
  f =@(k) Y(k+1).*(X(k)-X(k-1))./((X(k+1)-X(k)).*(X(k+1)-X(k-1)));
  g =@(k) Y(k)./(X(k)-X(k-1))-Y(k)./(X(k+1)-X(k));
  h =@(k) Y(k-1).*(X(k+1)-X(k))./((X(k)-X(k-1)).*(X(k+1)-X(k-1)));
  T= f(2:n-1) + g(2:n-1) - h(2:n-1);


endfunction