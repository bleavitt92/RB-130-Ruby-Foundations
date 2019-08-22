# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# input: array
# output: new array
# initialize empty output array
# start with first element in the array, break when get to last elemenet of the array
# if the current number is included in the array, skip it
# if the current number is not included in the array, add it to the output array

def missing_1(array)
  output = []
  num = array[0]
  loop do
    output << num if !array.include?(num)
    break if num >= array[-1]
    num += 1
  end
  output
end

def missing(array)
  (array[0]..array[-1]).to_a - array
end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4])# == []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []