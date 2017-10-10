# PHASE 2
class CoffeeError < StandardError
end

class FruitError < StandardError
end

class FriendError < StandardError
end

class NotLongEnough <  ArgumentError
end

def convert_to_int(str)

  begin
    Integer(str)
  rescue ArgumentError
    raise ArgumentError.new("rescue test")
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  puts "OMG, thanks so much for the #{maybe_fruit}!"
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    raise CoffeeError.new("Don't feed me coffee!") if maybe_fruit.include?("coffee")
    raise FruitError.new("I want a fruit!") if !FRUITS.include?(maybe_fruit.downcase)
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e
    retry
  rescue FruitError => e
    puts e
    retry
  end
end

# PHASE 4


class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise FriendError.new("friendship long enough") if (yrs_known<5)
    raise NotLongEnough.new("please put in fav pastime and name") if (name.length <= 0 || fav_pastime.length<=0)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
