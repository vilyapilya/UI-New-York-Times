require "byebug"
class Array

  def bubble_sort(&prc)
    swapped = true
    prc = Proc.new{|x, y| x <=> y} if prc == nil

    while swapped
      swapped = false
      i = 0
      while i < self.size - 1
        res = prc.call(self[i],  self[i+1])
        if res == 1
          self[i], self[i+1] = self[i+1], self[i]
          swapped = true
        end
        i+=1
      end

    end
    self
  end

  def binary_search(target)
    mid = self.size / 2

    return mid if self[mid] == target
    if target < self[mid]
      return self[0...mid].binary_search(target)
    else
      return self[mid+1 .. -1].binary_search(target) + mid + 1
    end
    nil
  end

 def quick
  return self if size <= 1
  pivot = [self[0]]
  left = self[1..-1].select {|el| el < pivot[0]}
  right = self[1..-1].select {|el| el > pivot[0]}
  left.quick + pivot + right.quick
 end

 def subset
    return self if size == 1
    res = [self]
    self.each do |el|
     subs = self.reject {|element| element == el}
     res = res + subs.subset
   end
   return res.uniq
 end

 def perm1
  if size == 2
    return [[self[0], self[1]], [self[1], self[0]]]
  end
  last = self.pop
  result_arr = []
  self.perm1.each_with_index do |sub, i|
    (sub.size + 1).times do |pos|
      temp = sub.dup.insert(pos, last)
      result_arr << temp
    end
  end

  result_arr
end

end

def fibb(num)
  return [1] if num == 1
  return [1,1] if num == 2
  fibb(num - 1) << fibb(num-1)[-1] + fibb(num-1)[-2]
end

p fibb(3)
