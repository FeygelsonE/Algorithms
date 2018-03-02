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
    return array if length <= 1
    pivot = partition(array, start, length, &prc)
    sort2!(array, start, pivot - start, &prc)
    sort2!(array, pivot + 1, length - 1 - pivot - start, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    bound = start

    ((start + 1)..(start + length - 1)).each do |i|
      if prc.call(array[start], array[i]) > 0
        bound += 1
        array[bound], array[i] = array[i], array[bound]
      end
    end

    array[bound], array[start] = array[start], array[bound]
    bound
  end
end


# p QuickSort.sort1([5, 9, 1, 19, 3, 99, 23, 4, 5, 17, 0])
# p QuickSort.sort2!([5, 9, 1, 19, 3, 99, 23, 4, 5, 17, 0])
