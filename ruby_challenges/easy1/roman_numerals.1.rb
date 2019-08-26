# input: number
# output: string
# to find largest digit, need to know place value by digits.size then divide by 10^digits.size-1 to get digit multiplied by the place value
# iterate over the place_values array. Take each value and replace it with the corresponding roman numeral

class RomanNumerals
  CONVERTION = { 
    1 =>'I',
    4 => 'IV',
    5 =>'V',
    9 => 'IX',
    10 =>'X',
    40 => 'XL',
    50 =>'L', 
    100 =>'C',
    400 => 'CD',
    500 =>'D',
    900 => 'CM',
    1000 =>'M'
    }

  def to_roman(number)
    output = ''
    place_values = []
    number.digits.each_with_index do |num, idx| 
      place_values << (num * 10**idx) # returns [0, 90, 300, 2000]
    end

    place_values.reverse!.map do |val|
      output << CONVERTION[val] unless CONVERTION[val].nil?
    end
    output
  end
end

p RomanNumerals.new.to_roman(641)

