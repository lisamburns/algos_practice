# Given an array of ints, find a method for finding m and n such that if you sort m - n,
# then the entire array is sorted, wher n - m is minimized.
# bubble sort the array, every time you swap you keep track of where you swapped (smallest and largest index)
require 'byebug'

def subsort_indices_2(arr)
  #find first index that is out of order
  idx1 = left_first_out_order(arr)
  return nil if idx1.nil?
  #find first index from right that is out of order
  idx2 = right_first_out_order(arr)
  #Find the min and max number in the middle (out of order sequence)
  min, max = extremes(arr, idx1, idx2)
  #start at idx1, move left until you find a number <= min
  idx1 -=1
  while idx1 > 0
    if arr[idx1] <= min
      break
    end
    idx1 -=1
  end
  # start at idx2, move right until you find a number >= max, return one before it!
  while idx2 < arr.length - 1
    if arr[idx2 + 1] >= max
      break
    end
    idx2 += 1
  end
  [idx1, idx2]
end

def left_first_out_order(arr)
  i = 1
  while i < arr.length - 1
    return i if arr[i] < arr[i-1]
    i += 1
  end
  nil # No items are out of order!
end

def right_first_out_order(arr)
  i = arr.length - 2
  while i >= 0
    return i if arr[i] > arr[i+1]
    i -=1
  end
  nil
end

def extremes(arr, idx1, idx2)
  # debugger
  min = nil
  max = nil
  i = idx1
  while i <= idx2
    min ||= arr[i]
    max ||= arr[i]
    min = [arr[i], min].min
    max = [arr[i], max].max
    i += 1
  end
  [min, max]
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
p subsort_indices_2(a)
b = [5, 6, 10, 15]
# p subsort_indices_naive(b)
p subsort_indices_2(b)
