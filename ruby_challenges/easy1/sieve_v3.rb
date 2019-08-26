
require 'pry'
class Sieve
  attr_accessor :range

  def initialize(n)
    @range = (2..n).to_a
  end

  def primes
    range.each do |prime|
      range.reject! { |num| (num !=prime) && (num % prime == 0) }
    end
  end
end

test = Sieve.new(10)
p test.primes