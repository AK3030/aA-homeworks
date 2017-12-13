def sum_to(n)
  return n if n == 1
  n + sum_to(n-1)
end

def add_numbers(arr)
  return arr[0] if arr.length == 1
  arr[0] + add_numbers(arr[1..-1])
end

def mone(n)
  gamma_fnc(n-1)
end
def gamma_fnc(n)
  return 1 if n == 1
  n * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
  return true if flavors[0] == favorite
  return false if flavors.length == 1
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(str)
  return str if str.length == 1
  str[-1] + reverse(str[0...-1])
end

p reverse("atom")
