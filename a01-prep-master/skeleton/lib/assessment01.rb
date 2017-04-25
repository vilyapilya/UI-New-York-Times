require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &blc)
    i = 0
    if accumulator.nil?
      accumulator = self[0]
      i+=1
    end

    while i < self.size
      accumulator = blc.call(accumulator, self[i])
      i+=1
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  i = 2
  while i < num
    return false if num % i == 0
    i+=1
  end
  true
end

def primes(num)
  i = 0
  j = 2
  res = []
  while i < num
    if is_prime?(j)
      res << j
      i+=1
    end
    j+=1
  end
  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  facs = factorials_rec(num-1)
  facs << facs.last * (num - 1)
  facs
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|k,v| k[v] = Array.new}
    self.each_with_index {|el, i| hash[el] << i}
    hash.select {|k,v| v.size > 1}

  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    i = 0
    subs = []
    while i < self.length - 1
      j = i +1
      while j < self.size
        temp = self.slice(i..j)
        subs << temp if temp == temp.reverse
        j+=1
      end
      i+=1
    end
    subs
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc = Proc.new {|x,y| x <=> y} if prc.nil?
    return self if self.size <= 1
    mid = self.size / 2
    left = self[0...mid]
    right = self[mid..-1]
    devided_l = left.merge_sort(&prc)
    devided_r = right.merge_sort(&prc)

    Array.merge(devided_l, devided_r, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      l = left[0]
      r = right[0]
      res =  prc.call(l,r)
      if res == 1
        merged << right.shift
      elsif res == 0
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end
end
