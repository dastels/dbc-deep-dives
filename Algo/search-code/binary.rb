def binary_search(ary, n)
  l = 0
  h = ary.count
  while l <= h
    m = ((l + h) / 2).floor
    if n < ary[m]
      h = m - 1
    elsif n > ary[m]
      l = m + 1
    else
      return true
    end
  end
  false
end
