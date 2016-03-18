# Given 2 squares on a 2D plane find a line that would cut the squares in half. Assume that squaresa are parallel to x axis
#Soln: if a line runs through the center of a square it will cut it in half

class Square

  attr_accessor :side_length, :center_x, :center_y

  def initialize(side_length, center_x, center_y)
    @side_length = side_length
    @center_x = center_x
    @center_y = center_y
  end

#Dont forget if squares have same center of line is vertical
# Format: y_multiplier*y = m*x + b
  def self.find_bisecting_line(sq1, sq2)
    return [nil, nil, nil] if sq1.center_x == sq2.center_x && sq1.center_y == sq2.center_y
    return [0, sq2.center_y, 0] if sq2.center_x == sq1.center_x
    y_multiplier = 1
    m = (sq2.center_y - sq1.center_y)/(sq2.center_x - sq1.center_x)
    b = sq1.center_y - m * sq1.center_x
    return [y_multiplier, m, b]
  end

end

class Line
  attr_accessor :y_mult, :m, :b

end

sq1 = Square.new(8, 2, 3)
sq2 = Square.new(4, 9,-3)

puts Square.find_bisecting_line(sq1, sq2)
