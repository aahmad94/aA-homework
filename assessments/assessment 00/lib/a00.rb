require "byebug"

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
  result = []
  words = str.split(" ")
  words.each do |word|
    result << caesar_cipher_word(word, shift)
  end
  result.join(" ")
end

def caesar_cipher_word(word, shift)
  result = ""
  alphabet = ("a".."z").to_a
  chars = word.split("")
  chars.each do |char|
    position = alphabet.index(char.downcase)
    net_shift = (position + shift) % 26
    result << alphabet[net_shift]
  end
  result
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => 2
# (4 + 3 + 2 + 2) => 11 => (1 + 1) => 2

def digital_root(num)
  return num if num < 10
  sum = digital_root_step(num)
  digital_root(sum)
end

def digital_root_step(num)
  return num if num < 10
  last_digit = num % 10
  last_digit + digital_root_step(num/10)
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  new_str = ""
  alphabet ||= ("a".."z").to_a
  str_chars = str.split("")
  alphabet.each do |chr|
    if str.include?(chr)
      str.count(chr).times do
        new_str << chr
      end
    end
  end
  new_str
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the)
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []
    self.each_index do |idx1|
      self.each_index do |idx2|
        if idx1 != idx2 && self[idx1] + self[idx2] == 0
          result << [idx1, idx2] unless result.include?([idx2, idx1])
        end
      end
    end
    result.uniq
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result = []
    self_chars = self.split("")
    self_chars.each_index do |idx1|
      self_chars.each_index do |idx2|
        if dictionary.include?(self_chars[idx1..idx2].join(""))
          result << self_chars[idx1..idx2].join("")
        end
      end
    end
    result.uniq
  end

end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  result = []
  (1..num).each do |div|
    if num % div == 0
      result << div
    end
  end
  result
end
