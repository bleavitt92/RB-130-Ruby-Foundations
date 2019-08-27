# WordProblem class with constructor that takes a string as an argument
# take the string, split it into words and get rid of 'what is' to format the string
# Have a hash 'plus' => :+ and use send ex: 2.send :+, 3
# iterate through the array of words performing the operations as you go
# delete the first 3 items, prepend the return value of the operation
require 'pry'
class WordProblem
  OPERATIONS = { 'plus' => :+, 'minus' => :-, 'multiplied' => :*, 'divided' => :/ }
  attr_accessor :string

  def initialize(string)
    @string = string
    @string = format_string
  end

  def format_string
    string.gsub(/What /, '').gsub(/is /, '').gsub(/by /, '').gsub(/\?/, '')
  end

  def answer
    raise ArgumentError unless valid?
    ops = []
    nums = []

    string.split(' ').each do |word|
      word.match(/[0-9]/) ? nums << word.to_i : ops << OPERATIONS[word]
    end

    result = nums[0]
    nums.each_with_index do |num, i|
      return result if i == ops.size
      result = result.send ops[i], nums[i+1]
    end
  end

  def valid?
    string.match(/(-?\d+\s(plus|multiplied|minus|divided)\s)+-?\d/)
  end
end

