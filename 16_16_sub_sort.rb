# Given an array of ints, find a method for finding m and n such that if you sort m - n,
# then the entire array is sorted, wher n - m is minimized.
# bubble sort the array, every time you swap you keep track of where you swapped (smallest and largest index)
require 'byebug'
def subsort_indices(a)
  start = last_in_order_start(a)
  return [0,0] if start == a.length - 1
  min = a[start]
  last = first_in_order_end(a)
  max = a[last]

  i = start
  while i < last # everything in middle should be min < x > max if sorted.
    if a[i] < min
      min = a[i]
    elsif a[i] > max
      max = a[i]
    end
    i += 1
  end

  if min != a[start]
    i = 0
    while i < a.length
      if min <= a[i]
        start = i
        break
      end
      i += 1
    end
  end

  if max != a[last]
    i = a.length - 1
    while i >= 0
      if max > a[i]
        last = i
        break
      end
      i -= 1
    end
  end
  [start, last]
end

def last_in_order_start(a)
  i = 0
  while i < a.length - 1
    break if a[i] > a[i + 1]
    i += 1
  end
  i
end

def first_in_order_end(a)
  i = a.length - 1
  while i > 0
    break if a[i - 1] > a[i]
    i -= 1
  end
  i
end

#O(n^2)
def subsort_indices_naive(a)
  swapped = true
  first_swap = a.length
  last_swap = 0

  while swapped == true
    i = 0
    swapped = false
    while i < a.length - 1
      if a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
        swapped = true
        first_swap = [first_swap, i].min
        last_swap = [last_swap, i + 1].max
      end
      i += 1
    end
  end
  return [0,0] if first_swap > last_swap
[first_swap, last_swap]
end

# O N2
a = [1,2,4,7,10,11,7,12,6,7,16,18,19]
# p subsort_indices_naive(a)
p subsort_indices(a)
b = [5, 6, 10, 15]
# p subsort_indices_naive(b)
p subsort_indices(b)
