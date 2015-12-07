FREQS = Hash.new(0)

def store_word_frequencies(text)
  words = text.split(/[.?\ \-\!\,]/)
  words.each {|word| FREQS[word.downcase] += 1}
end

def freq(word)
  FREQS[word]
end

text = "Hello, have you seen my book? It's an awesome book didn't you know I have always liked that book."
store_word_frequencies(text)
puts FREQS.inspect
puts freq("hello")
puts freq("book")


def slope(p1, p2)
  x1, y1 = p1
  x2, y2 = p2
  (y2 - y1).fdiv(x2 - x1)
end

def y_intercept(p1, slope) #y = mx + b => (y - mx) = b
  x1, y1 = p1
  y1 - slope * x1
end

def intersection(m1, b1, m2, b2)
  # m1*x + b1 = m2*x + b2
  # (m1 - m2)* x = b2 - b1
  # (b2 - b1)/(m1 - m2) = x
  # y = m1 * x + b1

  return -1 if m1 == m2
  x = (b2 - b1).fdiv(m1 - m2)
  y = m1 * x + b1
  [x, y]
end

def intersection_in_range?(x, y, line)
  p1, p2 = line
  x1, y1 = p1
  x2, y2 = p2
  x_in_range = (x >= [x1, x2].min) && (x <= [x1, x2].max)
  y_in_range = (y >= [y1, y2].min) && (y <= [y1, y2].max)
  x_in_range && y_in_range
end

def find_intersection(l1, l2)
  m1 = slope(l1[0], l1[1])
  m2 = slope(l2[0], l1[1])
  b1 = y_intercept(l1[0], m1)
  b2 = y_intercept(l2[0], m2)
  result = intersection(m1, b1, m2, b2)
  return -1 if result == -1
  x, y = result
  if intersection_in_range?(x, y, l1) && intersection_in_range(x, y, l2)
    return [x,y]
  else
    return -1
  end
end

def tic_tac_win(board)
  all_same?(board) || all_same?(transpose!(board)) || has_diagonals?(board)
end

def all_same?(rows)
  rows.each do |row|
    return true if row.all? {|el| el == 1} || row.all? {|el| el == 0}
  end
  return false
end

def transpose!(board)
  i = 0
  while i < board.length
    j = i
    while j < board.length
      board[i][j], board[j][i] = board[j][i], board[i][j]
      j += 1
    end
    i +=1
  end
  board
end

def has_diagonals?(board)
  row1 = [board[0][0], board[1][1], board[2][2]]
  row2 = [board[2][0], board[1][1], board[0][2]]
  all_same?([row1, row2])
end

board_win = [[1, 0, 0], [1, 1, 1], [0, 0, 1]]
board_lose = [[1, 0, 1], [1, 1, 0], [0, 1, 0]]
puts tic_tac_win(board_win)
puts tic_tac_win(board_lose)
