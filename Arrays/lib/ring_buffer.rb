require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @start_idx = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    if index > @length - 1
      raise "index out of bounds"
    else
      @store[(@start_idx + index)]
    end
  end

  # O(1)
  def []=(index, val)
    if index > @length - 1
      raise "index out of bounds"
    else
      @store[(@start_idx + index)] = val
    end
  end

  # O(1)
  def pop
    if @length == 0
      raise "index out of bounds"
    else
      @length -= 1
      new_last = @store[(@length + @start_idx)]
    end
  end

  # O(1) ammortized
  def push(val)
    if @length == @capacity
      resize!
    end
      @store[(@length + @start_idx)] = val
      @length += 1
  end

  # O(1)
  def shift
    if @length == 0
      raise "index out of bounds"
    else
      @start_idx += 1
      @length -= 1
      @store[@start_idx - 1]
    end
  end

  # O(1) ammortized
  def unshift(val)
    if @length == @capacity
      resize!
    end
    @start_idx -= 1
    @length += 1
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    ####NA
  end

  def resize!
    prev = @store
    @capacity = @capacity * 2
    @store = StaticArray.new(@capacity)
    i = 0
    while i < @length
      @store[i] = prev[(i + @start_idx)]
      i += 1
    end
    @start_idx = 0
  end
end
