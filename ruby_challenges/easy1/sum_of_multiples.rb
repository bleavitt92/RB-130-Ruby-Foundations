require 'pry'

class SumOfMultiples
  attr_reader :numbers

  def initialize(num1=3, num2=5, *num3)
    @numbers = [num1, num2, num3].flatten!
  end

  def self.to(number, divisors= [3, 5])
    multiples = divisors.map do |num|
      (1...number).to_a.select do |mult|
        mult % num == 0
      end
    end
    multiples.flatten.uniq.inject(0, &:+)
  end

  def to(number)
    self.class.to(number, divisors = numbers)
  end

  def multiple?(number, divisor)
    number % divisor == 0
  end
end

p SumOfMultiples.to(100)
p SumOfMultiples.new(3, 5, 7).to(10)
p SumOfMultiples.new(4, 6).to(15)
p SumOfMultiples.to(1)