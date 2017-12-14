# these algorithms work with ints instead of strings for simplicity

def slug_oct(arr)
  arr.each do |el1|
    is_largest = true
    arr.each do |el2|
      next if el2 == el1
      is_largest = false if el2 > el1
    end

    return el1 if is_largest
  end

end

def dom_oct(arr)
  # ruby uses quicksort which is nlogn
  arr.sort[-1]
end

def clever_octopus(arr)
  greatest = arr[0]
  arr.each {|el| greatest = el if el > greatest}
  greatest
end

def slow_dance(target, tiles_array)
  ans = nil
  tiles_array.each_with_index {|el, i| ans = i if el == target}
  ans
end

def fast_dance(target, tiles_hash)
  tiles_hash[target]
end
