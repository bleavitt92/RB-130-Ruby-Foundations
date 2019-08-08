# write a reduce method that takes at least 1 argument - representing the array we'll operate on. It should take an optional second argument that represents the default value for the accumulator. 

def reduce(array, accumulator = array[0])
  counter = 0

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # =>  "aabc"
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # =>  [1, 2, 1, 2, "a", "b"]
p reduce([1, 2, 3, 4, 5]) { |acc, num| acc + num }        # => 16
p reduce([1, 2, 3, 4, 5], 10) { |acc, num| acc + num }   # => 25