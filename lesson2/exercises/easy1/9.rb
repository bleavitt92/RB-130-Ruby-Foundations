def one1?(array) # this continues iteration even after found the second true
  array.map { |value| yield(value) }.count(true) == 1 ? true : false
end

def one?(array)
  true_value_count = 0
  array.each do |value|
    true_value_count += 1 if yield(value)
    return false if true_value_count > 1
  end
  true
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7,]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
