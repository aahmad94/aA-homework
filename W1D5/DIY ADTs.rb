class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  attr_reader :stack

  def add(el)
    # adds an element to the stack
    stack.push(el)
  end

  def remove
    # removes one element from the stack
    stack.pop
  end

  def show
    # return a copy of the stack
    stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  attr_reader :queue

  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.pop
  end

  def show
    queue.pop
  end
end

class Map
  def initialize
    @arr = Array.new
  end

  attr_reader :arr

  def assign(key, val)
    self.remove(key) if arr.any? { |tuple| tuple.include?(key) }
    arr.push([key, val])
  end

  def lookup(key)
    arr.each do |tuple|
      return tuple if tuple[0] == key
    end
  end

  def remove(key)
    arr.each do |tuple|
      if tuple[0] == key
        @arr = arr - [tuple]
      end
    end
  end


  def show
    arr
  end

end
