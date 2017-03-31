# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alf = ("a".."z").to_a
  str = str.split(" ")
  res = []
  str.each do |word|
    temp = ""
    word.each_char do |c|
      old_i = alf.find_index(c)
      new_i = (old_i + shift) % alf.size if shift > 0
      new_i = (old_i - shift) % alf.size if shift < 0
      temp << alf[new_i]
    end
    res << temp
  end
  res.join(" ")
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10
  return digital_root((num % 10) + digital_root(num / 10))
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = ("a".."z").to_a)
  res = ""
  alphabet.each {|l| res << str.chars.select {|el| el == l}.join }
  res

end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    res = []
    i = 0
    while i < self.size-1
      j = i +1
      while j < self.size
        res << [i, j] if self[i] + self[j] == 0
        j+=1
      end
      i+=1
    end
   res
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.
  def subs
    i = 0
    res = []
    while i < self.length-1
        j = 0
      while j < self.length
        substr = self.slice(i..j)
        res << substr unless res.include?(substr)
        j+=1
      end
      i+=1
    end
    res
  end

  def real_words_in_string(dictionary)
    self.subs.select {|subs| dictionary.include?(subs)}
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  res = [1, num]
  i = 2
  while i < num
    res << i if num % i == 0
    i+=1
  end
  res.sort {|x,y| x <=> y}
end
