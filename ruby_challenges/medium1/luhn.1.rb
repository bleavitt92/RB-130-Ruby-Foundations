class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    addend = number.digits.each_with_index.map do |num, i| 
      i.odd? ? num*2 : num
    end

    addend.map! { |num| num >=10 ? num-9 : num }.reverse
  end

  def checksum
    self.addends.inject(:+)
  end

  def valid?
    self.checksum % 10 == 0
  end

  def self.create(number)
    value = new(number*=10)
    if value.checksum % 10 == 0
      last_digit = 0
    else
      last_digit = 10 - (value.checksum % 10)  
    end
    number += last_digit
  end
end

luhn = Luhn.new(1230)
p luhn.addends
p luhn.checksum
p luhn.valid?
p Luhn.create(873_956)
