def sum_to(n)
  return nil if n < 0
  return n if n == 1
  return n + sum_to(n-1) if n > 0
end

def add_numbers(arr)
  return nil if arr.size == 0
  return arr[0] if arr.size == 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1
  return (n-1) * gamma_fnc(n - 1)
end

def ice_cream_shop(arr, ice)
  return false if arr.size <= 0
  arr[0] == ice ? (return true) : (ice_cream_shop(arr[1..-1], ice))
end

def reverse(str)
  return str if str.length <= 1
  return str[str.size-1] + reverse(str[0..-2])
end
 p reverse("house") # => "esuoh"
  p reverse("dog") # => "god"
p   reverse("atom") # => "mota"
p  reverse("q") # => "q"
p  reverse("id") # => "di"
p  reverse("") # => ""
