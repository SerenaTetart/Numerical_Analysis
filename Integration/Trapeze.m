function r = Trapeze(X, Y)
  
  k=length(X);
  r= 0;
  for i = 1:k-1
    r = r+((X(i+1)-X(i)).*(1/2).*(Y(X(i))+Y(X(i+1)));
  endfor

endfunction