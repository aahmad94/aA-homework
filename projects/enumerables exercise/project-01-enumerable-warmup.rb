# aahmad5394@gmail.com
# nwilliams770@gmail.com
class Array
  def my_each(&prc)
  i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |el|
      if prc.call(el)
        selected << el
      end
    end
    selected
  end


  def my_reject(&prc)
    selected = []
    self.my_each do |el|
      unless prc.call(el)
        selected << el
      end
    end
    selected
  end

  def my_any?(&prc)
    self.my_each do |el|
      if prc.call(el)
        return true
      end
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      if !(prc.call(el))
        return false
      end
    end
    true
  end


  def my_flatten
    new_arr = []
    self.my_each do |el|
      # el.class == Array ? new_arr += el.my_flatten : new_arr += el
      if el.class == Array
        new_arr = new_arr + el.my_flatten
      else
        new_arr << el
      end
    end
    new_arr
  end

def my_zip(*args)
  result = []
  self.each_index do |idx|
  temp = []
  temp << self[idx]
    args.each do |arr|
      temp << arr[idx]
    end
    result << temp
  end
  result
end

  def my_rotate(shift = 1)
    if shift < 0
      net_rotation = (shift + self.length).abs % self.length
      self.drop(net_rotation) + self.take(net_rotation)
    else
      net_rotation = shift % self.length
      self.drop(net_rotation) + self.take(net_rotation)
    end
  end

  def my_join(separator = "")
    result = ""
    arr = self.map(&:to_s)

    arr.each_index do |idx|
      if idx == length - 1
        result << arr[idx]
      else
        result << arr[idx] + separator
      end
    end
    result
  end

  def my_reverse
    result = []
    self.each do |el|
      result.unshift(el)
    end
    result
  end

end


# my_each
# [1, 2, 3].my_each do |num|
#   puts num
# end
#
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end


#my_select
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# #my_reject
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

#my_any & my_all
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# my _flatten
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

#my_zip

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# #my_rotate
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-5)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

#my_join
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

#my_reverse
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]
