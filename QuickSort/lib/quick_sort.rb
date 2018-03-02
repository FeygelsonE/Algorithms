class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    i = 1
    left = []
    right = []
    while i < array.length
      if array[i] <= pivot
        left << array[i]
      else
        right << array[i]
      end
      i += 1
    end
    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if array.length <= 2

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    par = start + 1
    
  end
end

def blaa(array)
  return array if array.length <= 1
  pivot = array[0]
  i = 1
  left = []
  right = []
  while i < array.length
    if array[i] <= pivot
      left << array[i]
    else
      right << array[i]
    end
    i += 1
  end
  blaa(left) + [pivot] + blaa(right)
end

# p QuickSort.sort1([5, 9, 1, 19, 3, 99, 23, 4, 5, 17, 0])
