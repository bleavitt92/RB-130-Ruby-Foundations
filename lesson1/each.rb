# build own each method that takes an array and exhibits the same behaiors as Array#each

# method implementation
def each(array)
  counter = 0
  
  while counter < array.size
    yield(array[counter])                   # yield to the block, passing in the current element to the block
    counter += 1
  end
  
    array               # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

# method invocation
each([1, 2, 3, 4, 5]) do |num|
  puts num
end

p each([1, 2, 3, 4, 5]) { |num| "do nothing" }.select{ |num| num.odd? }