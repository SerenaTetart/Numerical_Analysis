function P = Hermite(x, X, Y, Y2)
  
  P=0;
  n=length(X);
  
  for i=0:n-1
    l=1; l2=0;
    for j=0:n-1
      if j~=i
        l = l.*(((x-X(j+1))./(X(i+1)-X(j+1))).^2);
        l2 = l2+(2/(X(i+1)-X(j+1)));
      endif
    endfor
    P = P+(l.*(Y(i+1)+(x-X(i+1)).*(Y2(i+1)-(l2.*Y(i+1)))));
  endfor

endfunction