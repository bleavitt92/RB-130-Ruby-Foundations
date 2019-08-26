class Octal
  BASE = 8
  attr_reader :number

  def initialize(number)
    @number = number.gsub(/\A0*/, '').to_i
  end

  def to_decimal
    return 0 if invalid(number)  unless number == 1
    power = 0
    sum = 0
    number.digits.each do |digit|
      sum += digit * BASE**power
      power += 1
    end
    sum
  end

  def invalid(num)
    num != num.to_s.to_i ||
    num < 10 ||
    num.digits.any? { |num| num > 8 }
  end
end

p Octal.new('123').to_decimal
p Octal.new('abc').to_decimal
p Octal.new('129').to_decimal
p Octal.new('0').to_decimal
p Octal.new('4').to_decimal
p Octal.new('011').to_decimal
p Octal.new('hello').to_decimal