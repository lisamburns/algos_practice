require 'byebug'

def zeros_n_factorial(n)
  count = 0
  return -1 if n < 0

  factor = 5 # will increase 5, 25, 125
  while factor < n
    count += n / factor #number of 5's between 5 and n. 25 counts as 2, and will get counted twice because factor will equal 5, then 25. 
    factor *= 5
  end
  count
end

def factorial(n)
  return 1 if n == 1
  return n * factorial(n - 1)
end

def num_trailing_zeros(n)
  digits = n.to_s.split("").reverse
  num_zeros = 0
  i = 0
  while i < digits.length
    break if digits[i] != "0"
    num_zeros += 1
    i += 1
  end
  num_zeros
end

puts num_trailing_zeros(5600000)

puts "20:"
puts factorial(20)
puts zeros_n_factorial(20)
puts num_trailing_zeros(factorial(20))

puts "50:"
puts factorial(50)
puts zeros_n_factorial(50)
puts num_trailing_zeros(factorial(50))
