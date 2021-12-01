function X = Tchebychev(a, b, n)
  
  X = (a+b)/2 -(b-a)/2 *cos((2*(0:n)+1)*pi/(2*(n+1)));

endfunction