require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    if index > @length - 1
      raise "index out of bounds"
    else
      @store[index]
    end
  end

  # O(1)
  def []=(index, value)
    if index > @length - 1
      raise "index out of bounds"
    else
      @store[index] = value
    end
  end

  # O(1)
  def pop
    if @length == 0
      raise "index out of bounds"
    else
      @length = @length - 1
      @store[length]
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length >= @capacity
      resize!
    end
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    if @length == 0
      raise "index out of bounds"
    else
      result = @store[0]
      @length = @length - 1
      i = 0
      while (i < length)
        @store[i] = @store[i + 1]
        i += 1
      end
      result
    end
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    reversed_idx = (1..@length).to_a.reverse
    reversed_idx.each_with_index do |i, idx|
      @store[i] = @store[i - 1]
    end
    @store[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    index
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    prev = @store
    @capacity = 2 * @capacity
    @store = StaticArray.new(@capacity)
    i = 0
    while (i < @length)
      @store[i] = prev[i]
      i += 1
    end
  end
end
