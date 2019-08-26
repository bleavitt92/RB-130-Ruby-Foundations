class Trinary
  BASE = 3
  attr_reader :number

  def initialize(number)
    @number = number.gsub(/\A0*/, '').to_i
  end

  def to_decimal
    return 0 if invalid?(number)
    sum = 0
    number.digits.each_with_index do |num, idx|
      sum += num*BASE**idx
    end
    sum
  end

  def invalid?(num)
    num != num.to_s.to_i || num.digits.any? { |num| num < 0 }
  end
end

p Trinary.new('10').to_decimal
p Trinary.new('222').to_decimal
p Trinary.new('1234').to_decimal
p Trinary.new('12').to_decimal
p Trinary.new('apple').to_decimal
