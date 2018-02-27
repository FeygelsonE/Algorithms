# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store
  attr_reader :length

  def initialize
    @length = 0
    @store = RingBuffer.new()
  end

  def enqueue(val)
    @store.push(val)
    @length += 1
  end

  def dequeue
    if @length == 0
      raise "index out of bounds"
    else
      @length -= 1
      @store.shift
    end
  end

  def max
    cur_max = nil
    find_max = @store
    i = 0
    while i < @length
      cur_max = find_max[i] if (cur_max == nil || find_max[i] > cur_max)
      i += 1
    end
    cur_max
  end

  def length
    @length
  end

end
