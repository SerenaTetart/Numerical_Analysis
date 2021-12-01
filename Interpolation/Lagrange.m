function [P, L] = Lagrange (x, X, Y)
  
  P=0;
  n=length(X);
  for k=0:n-1
    l=1;
    for i=0:n-1
      if i~=k
        l=l.*((x-X(i+1))./(X(k+1)-X(i+1)));
      endif
    endfor
    P=P+(Y(k+1)*l);
  endfor
  
endfunction