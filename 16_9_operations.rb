#Implement multiply subtract divide for ints. results are all integers. use only the add operator

def multiply(x, y)
  i = 0
  result = 0
  while i < y
    result += x
    i += 1
  end
  result
end


#x - y = z
# z + y = x
# try different values for z until you get z + y = x
def subtract(x, y)
  z = 0
  return z if x == y
  direction = (z + y > x ) ? -1 : 1
  until (z + y ) == x
    z = z + direction
  end
  z
end


# subtract b from a
# count every time until sum is zero
def divide(a, b)
    count = 0
    until a <=0
      a -= b
      count +=1
    end
    count
end

puts "Multiply Answer: 20"
puts multiply(4,5)

puts "Subtract answer: 7"
puts subtract(20, 13)

puts "Divide answer 4"
puts divide(12, 3)
