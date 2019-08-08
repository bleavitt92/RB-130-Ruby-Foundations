# write a reduce method that takes at least 1 argument - representing the array we'll operate on. It should take an optional second argument that represents the default value for the accumulator. 

def reduce(array, accumulator = 0)
  counter = 0
  
  while counter < array.size
    #yield(accumulator, array[counter]) # passing accumulator and array[counter] to the block so that the block is                                     called with them as the arguments
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass