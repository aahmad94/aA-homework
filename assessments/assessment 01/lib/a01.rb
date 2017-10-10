class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= Proc.new { |num1, num2| num1 <=> num2 }

    mid = self.length / 2

    left, right = self.dup.take(mid), self.dup.drop(mid)
    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)

    Array.merge(left_sorted, right_sorted, &prc)
  end

  private
  def self.merge(left, right, &prc)
    return left if right.empty?
    return right if left.empty?

    case prc.call(left.first, right.first)
    when -1
      smaller = left.shift
    when 0
      smaller = left.shift
    when 1
      smaller = right.shift
    end

    [smaller].concat(Array.merge(left, right, &prc))
  end

end

class Array
  # Write an array method that returns `true` if two elements of the array sum
  # to 0 and `false` otherwise
  def two_sum
    self.each_index do |idx1|
      self.each_index do |idx2|
        if idx1 < idx2 && self[idx1] + self[idx2] == 0
          return true
        end
      end
    end
    false
  end
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
  return 0 if nums.empty?
  first = nums.shift
  first + sum_rec(nums)
end

class String
  # A substring is considered a subword if it appears in a dictionary.

  # Write a `String#subword_counts` method that takes a dictionary (array
  # of strings) and returns a hash where each key-value pair contains a subword
  # of the string (as the key) and the number of times the subword appears
  # in the string (as the value)

  # For example, `"atcats".subword_counts(["at", "cat"])` should return
  # `{ "at" => 2, "cat" => 1 }`

  def subword_counts(dictionary)
    counter_hash = Hash.new(0)
    self.split("").each_index do |idx1|
      self.split("").each_index do |idx2|
        if dictionary.include?(self[idx1..idx2])
          counter_hash[self[idx1..idx2]] += 1
        end
      end
    end
    counter_hash
  end
end

def is_prime?(num)
  return false if num == 1
  (2...num).none? do |div|
    num % div == 0
  end
end

# Write a method that returns the nth prime number
def nth_prime(n)
  primes = []
  int = 2
  until primes.length == n
    if is_prime?(int) == true
      primes << int
    end
    int += 1
  end
  primes.last
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an array method that calls the given block on each element and
  # combines each result one-by-one with a given accumulator. If no accumulator is
  # given, the first element is used.
  def my_inject(acc = nil, &prc)
    acc ||= self.shift
    self.each do |el|
      acc = prc.call(acc, el)
    end
    acc
  end
end
