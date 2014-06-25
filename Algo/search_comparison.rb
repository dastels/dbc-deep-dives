require 'multiset'

def search(ary, n)
  work = 0
  ary.each do |e|
    work += 1
    return [true, work] if e == n
  end
  [false, work]
end

def binary_search(ary, n)
  work = 0
  l = 0
  h = ary.count
  while l <= h
    work += 1
    m = ((l + h) / 2).floor
    if n < ary[m]
      h = m - 1
    elsif n > ary[m]
      l = m + 1
    else
      return [true, work]
    end
  end
  [false, work]
end

                   
def analyze_linear_search
  a = (0...1000).to_a.map {|i| rand(10000) }
  
  m = Multiset.new
  
  (0...1000).each do |i|
    found, work = search(a, rand(10000))
    m << work
  end
  
  m
end

def analyze_binary_search
  a = ((0...1000).to_a.map {|i| rand(10000) }).sort
  
  m = Multiset.new
  
  (0...1000).each do |i|
    found, work = binary_search(a, rand(10000))
    m << work
  end
  
  m
end



def contains_duplicates(ary)
  (0..ary.count).each do |i|
    (0..ary.count).each do |j|
      if i != j
        return true if ary[i] == ary[j]
      end
	end
  end
  false
end


