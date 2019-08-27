# detect palindrome products in a given range
# range is given by factors. a max and a min. so if 1 and 9, largest possible number is 81 but not a palindrome
# return in an array of the factors that create the palindrome

# first - need an array of the palindromes
# initialize an empty palindrome array
# iterate from 1 up to the max factor twice multiplying n by m, if a palindrome, add to array
# is a palindrome if string == string.reverse

require 'pry'
class Palindromes 
  attr_reader :max, :min, :factors

  def initialize(max_factor: max, min_factor: 1)
    @max = max_factor
    @min = min_factor
    @palindromes = Hash.new([])
  end

  def generate
    min.upto(max) do |m|
      min.upto(max) do |n|
        if palindrome?(m*n) && @palindromes[m*n].empty?
          @palindromes[m*n] = [[m, n]].sort 
        elsif palindrome?(m*n) && !@palindromes[m*n].empty?
          @palindromes[m*n] << [m, n].sort 
        end
      end
    end
    @palindromes.each { |k, v| v.uniq! }
    @palindromes
  end

  def largest
    palindrome = Palindromes.new(max_factor: max, min_factor: min).generate
    Struct.new(:value, :factors).new(palindrome.keys.max, palindrome[palindrome.keys.max])
  end

  def smallest
    palindrome = Palindromes.new(max_factor: max, min_factor: min).generate
    Struct.new(:value, :factors).new(palindrome.keys.min, palindrome[palindrome.keys.min])
  end

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end
