def solve(target, candidates, soln_idx = 0, solns = [], sum = 0)
  return if sum > target
  return if target - sum > candidates.min

  i = 0
  while i < candidates.length
      next if candidates[i] > target
      # use the coin
      solve(target, candidates, soln_idx, solns[soln_idx] << candidates[i], sum + candidates[i])
      # don't use it
      solve(target, candidates.drop(1), soln_idx + 1, solns)
      i += 1
  end

  soln
end

def print_sum(candidates, index, n)
  i = 1
  while i <=n
    p candidates
    p candidates[i]
    # candidates[index[i]] << ( i == n) ? "" : "+"
     i += 1
  end
end

def solve2(target, sum, candidates, size, index, n)
  if sum > target
    return nil;
  end

  if sum == target
    print_sum(candidates, index, n)
  end

  i = index[n]
  while i < size
    index[n + 1] = i
    solve2(target, sum + candidates[i], candidates, size, index, n + 1)
    i += 1
  end
end

def solve(target, candidates, size)
  index = [0]
  solve2(target, 0, candidates, size, index, 0)
end

solve(7, [2,3,6,7], 4)
