require 'byebug'
def largest_contig_seq_sum(arr)
  sum = 0
  max_sum = 0

  arr.each do |el|
    sum += el
    max_sum = sum if sum > max_sum
    sum = 0 if sum < 0
  end
  max_sum
end

a = [2, -8, 3, -2, 4, -10]
puts largest_contig_seq_sum(a)
