def any_take1(array)
  values = []
  array.each do |value|
    values << yield(value)
    break if yield(value) == true
  end
  values.last == true
end

def any?(array)
  array.each { |value| return true if yield(value) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 2, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false