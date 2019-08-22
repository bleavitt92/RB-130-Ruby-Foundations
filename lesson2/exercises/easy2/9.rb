def each_cons1(array)
  index = 0
  while index < array.size-1
    yield(array[index], array[index+1])
    index += 1
  end
  nil
end

def each_cons(array)
  array.each_with_index do |val, idx|
    break if idx >= array.size-1
    yield(val, array[idx+1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil