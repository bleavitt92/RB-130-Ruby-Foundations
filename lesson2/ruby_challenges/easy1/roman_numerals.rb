# input: number
# output: string
# to find largest digit, need to know place value by digits.size then divide by 10^digits.size-1 to get digit multiplied by the place value
# iterate over the place_values array. Take each value and replace it with the corresponding roman numeral

require 'pry'
hash = { 1=>'I', 5=>'V', 10=>'X', 50=>'L', 100=>'C', 500=>'D', 1000=>'M' }

string = ''

place_values = []
450.digits.each_with_index do |num, idx| 
  place_values << (num * 10**idx) # returns [0, 90, 300, 2000]
end 
p place_values.reverse!

place_values.map do |num|
  loop do 
    break if num == 0
    if num >= 1000
      string << 'M'
      num -= 1000
    elsif num >=500
      string << 'D'
      num -= 500
    elsif num >=100
      string << 'C'
      num -= 100
    elsif num >=50
      string << 'L'
      num -= 50
    elsif num >=10
      string << 'X'
      num -=10
    elsif num >=5
      string << 'V'
      num -= 5
    elsif num >=1
      string << 'I'
      num -= 1
    end
  end
end

puts string