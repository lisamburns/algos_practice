#Given a 2D graph with several points compute the line which passes through the most points

class Point
  attr_accessor :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def ==(p)
    return self.x == p.x && self.y == p.y
  end

  def self.find_bisecting_line(p1, p2)
    return [nil, nil, nil] if p1 == p2
    return [0, p2.y, 0] if p1.x == p2.x
    y_multiplier = 1
    m = (p2.y - p1.y).fdiv(p2.x - p1.x)
    b = p1.y - m * p1.x
    return [y_multiplier, m, b]
  end

end

#accepts an array of points
def find_best_line(arr)
  points = arr.map {|coords| Point.new(*coords)}
  @lines_freq = Hash.new(0)
  i = 0
  while i < points.length - 1
    j = i + 1
    while j < points.length - 1
      @lines_freq[Point.find_bisecting_line(points[i], points[j])] += 1
      j += 1
    end
    i += 1
  end
  @lines_freq.max_by {|key, val| val }
end

points = [ [3,2], [1,1], [4,2], [4,1], [4,1], [8,2], [3,3], [-1,-5]]
puts find_best_line(points)
