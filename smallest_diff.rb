# N2 solution is to loop through arr1, loop through arr2
# sort both arrays nlogn + mlogm. for each item in first array, binary_search 2nd for its complement n*logm
# where complement is number most similar.
# merge both arrays into 1, every time you switch arrays check diff against the smallest diff found so far.

def smallest_diff(arr1, arr2)
  return -1 if arr1.length == 0 || arr2.length == 0

  a = arr1.sort!
  b = arr2.sort!
  merge_sorted(a, b)
end

def merge_sorted(a, b)
  i = 0
  j = 0
  smallest_diff = (a[0] - b[0]).abs
  while i < a.length && j < b.length
    last_a = a[i]
    last_b = b[j]

    this_diff = (last_a - last_b).abs
    smallest_diff = [smallest_diff, this_diff].min

    last_a < last_b ? i += 1 : j += 1

  end
  smallest_diff
end

a = [1, 3, 15, 11, 2]
b = [23, 127, 235, 19, 8]
puts smallest_diff(a,b)
