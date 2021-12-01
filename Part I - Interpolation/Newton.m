function p = Newton (a, x, y)
  
  n = length(x);
  d = y;
  for k = 1:n-1
    for i = 1:n-k
      d(i) = (d(i+1)-d(i))/(x(i+k)-x(i));
    endfor
  endfor
  
  p = d(1);
  for i = 2:n
    p = d(i) + p.*(a-x(i));
  endfor
  
endfunction
