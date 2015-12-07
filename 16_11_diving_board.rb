# given shorter and longer lengths of planks,
#output all possible lengths for the diving board given that it must use K planks.
# 2 planks, 3, 5 => [6, 8, 10]
# 0 .. num_planks * the shorter + the longer

def diving_board_lengths(num_planks, shorter, longer)
    num_shorter = 0
    lengths = {}

    while num_shorter <= num_planks
      num_longer = num_planks - num_shorter
      length = num_shorter * shorter + num_longer * longer
      lengths[length] = true
      num_shorter += 1
    end

    lengths.keys
end

puts "First test"
p diving_board_lengths(2, 3, 5)
puts "Second test"
p diving_board_lengths(9, 3, 5)
