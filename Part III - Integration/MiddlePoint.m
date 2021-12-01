function r = MiddlePoint(X, Y)
  
  k=length(X);
  r= 0;
  for i = 1:k-1
    r = r+((X(i+1)-X(i)).*Y((X(i)+X(i+1))/2));
  endfor

endfunction