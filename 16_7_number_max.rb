# Write method that finds max of two numbers, but you can't use if else or any other comparison operator

def number_max(a, b)
  sum = a + b
  diff = (a - b).abs
  (sum + diff)/2
end

# (5 + 2) = 7
# diff = 3
# max = (7 + 3)/2
puts number_max( 5, 2)
puts number_max( 99, 23)
puts number_max( 5, 20)

# 2 % 10 = 2
# 10 % 2 = 0
