def single_element_in_sorted_array(arr)
  mid = arr.length / 2
  if arr[mid] != arr[mid+1] && arr[mid] != arr[mid-1]
    return arr[mid]
  end
  if arr[mid] == arr[mid-1]
    lower_size = mid + 1
  else
    lower_size = mid
  end
  upper_size = arr.length - lower_size
  if lower_size.odd?
    single_element_in_sorted_array(arr[0...lower_size])
  else
    single_element_in_sorted_array(arr[(mid+1)...arr.length])
  end
end

# p single_element_in_sorted_array([1, 1, 2, 3, 3, 4, 4, 5, 5])

def well_formed(string)
  # only [,],{,},(,)
  stack = []
  string.each_char do |ch|
    if stack.length == 0
      if ch == "]" || ch == "}" || ch == ")"
        return false
      else
        stack.push(ch)
      end
    elsif ch == "]" || ch == "}" || ch == ")"
      if ch == "]" && stack.last != "["
        return false
      elsif ch == "}" && stack.last != "{"
        return false
      elsif ch == ")" && stack.last != "("
        return false
      else
        stack.pop
      end
    else
      stack.push(ch)
    end
  end
  if stack.length == 0
    return true
  end
  false
end

p well_formed("{(])}") #false
p well_formed("{{[[(([[()]]))]]}}") #true
p well_formed("}") #false
p well_formed("{{[[(([[()]]))]}}") #false
p well_formed("[]") #true
p well_formed("[") #false
