def search(ary, n)
  ary.each do |e|
    return true if e == n
  end
  false
end
