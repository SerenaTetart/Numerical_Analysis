function r = Simpson(X, Y)
  
  k=length(X);
  r= 0;
  for i = 1:k-1
    r = r+((X(i+1)-X(i)).*(((1/6)*Y(X(i)))+((2/3)*Y((X(i)+X(i+1))/2))+((1/6)*Y(X(i+1)))));
  endfor

endfunction