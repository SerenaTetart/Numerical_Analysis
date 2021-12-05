function e = GramSchmidt(v)
  
  n=length(v);
  e = []; u = [];
  for k = 1:n
    u(k, :) = v(k, :)
    for j  = 1:k-1
      u(k, :) = u(k, :) - (((u(j, :).*v(k, :))/(u(j, :).*u(j, :)))*u(j, :))
    endfor
    e(k, :) = u(k, :)/norm(u(k, :))
  endfor

endfunction