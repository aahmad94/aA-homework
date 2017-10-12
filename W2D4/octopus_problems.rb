# Sluggish Octopus
#
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(arr)
  arr.each_index do |idx1|
    max_length = true
    fish1 = arr[idx1]

    arr.each_index do |idx2|
      # next if idx1 == idx2
      fish2 = arr[idx2]

      if fish1.length < fish2.length
        max_length = false
      end
    end

    return fish1 if max_length == true
  end
end

# p sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.

def actual_dominant_octopus(arr)
  dominant_octopus(arr).last
end


def dominant_octopus(arr)
  return arr if arr.length <=  1
  mid = arr.length / 2
  left, right = arr.take(mid), arr.drop(mid)
  left_sorted, right_sorted = dominant_octopus(left), dominant_octopus(right)
  dominant_octopus_merge(left_sorted, right_sorted)
end

def dominant_octopus_merge(left, right)
  return left if right.empty?
  return right if left.empty?
  smaller = left.first.length < right.first.length ? left.shift : right.shift
  [smaller].concat(dominant_octopus_merge(left, right))
end

# p actual_dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(arr)
  longest_fish = arr.shift
  arr.each do |el|
    longest_fish = el if longest_fish.length < el.length
  end
  longest_fish
end

# p clever_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(dir, arr)
  arr.each_index do |idx|
    target = arr[idx]
    if dir == target
      return idx
    end
  end
  nil
end

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

def fast_dance(dir, hash)
  hash[dir]
end
