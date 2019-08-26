# create a hash where the keys are each number 2 up to the range
# start with each value being 'true'
# set multiplier = 2
# starting with 2, and going up to n, 2 * multiplier and mark as false. Increment the multiplier by 1 each loop.  
# change to 'false' when mark them
# select all keys with a value of 'true' and add to an output array
require 'pry'
class Sieve
  attr_accessor :numbers, :n

  def initialize(n)
    @numbers = Hash.new
    @n = n
    (2..n).each { |num| numbers[num] = true } # all nums start as prime
  end

  def primes
    (2..n).map do |num|
      multiplier = 2
      loop do
        break if num * multiplier > n
        numbers[num*multiplier] = false if num*multiplier <= n
        multiplier += 1
      end
    end

    numbers.keep_if { |num, val| val == true }.keys
  end
end

test = Sieve.new(10)
p test.primes