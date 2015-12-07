# Write method that finds max of two numbers, but you can't use if else or any other comparison operator

def number_max(a, b)
  k = a / b # either > 0 or 0
  k = k / k # is either 0 if a < b, or 1 if a >= b
  not_k = 1 - k # 0 if k = 1, 1 if k = 0

  a * k + b * not_k
end

puts number_max( 5, 2)
puts number_max( 99, 23)
puts number_max( 5, 20)

# 2 % 10 = 2
# 10 % 2 = 0
