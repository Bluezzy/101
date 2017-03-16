# code wars exercice solution with recursion

def perfect_triangle(n)
  return 0 if n == 0
  perfect_triangle(n-1) + n
end
