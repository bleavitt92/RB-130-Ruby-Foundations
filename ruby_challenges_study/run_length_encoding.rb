# input: string
# output: string
# iterate through the input string, adding to the output string. 
# as iterate through, add 1 to counter when the letter == current letter
# if the letter does not equal the current letter, add counter and current letter to the output
# update current letter to be the letter on now. 
require 'pry'
class RunLengthEncoding
  def self.encode(input)
    counter = 0
    current_letter = input[0]
    output = []
    input.each_char do |letter|
      if letter == current_letter
        counter += 1
      else
        output << counter if counter > 1
        output << current_letter
        current_letter = letter
        counter = 1
      end
    end
    output << counter if counter > 1
    output << current_letter
    output.join
  end 

  def self.decode(input)
    output = ''
    array = input.scan(/\d*./)
    array.each do |item|
      num = item[0..-2].to_i
      num == 0 ? num = 1 : num = num
      letter = item[-1]
      output << letter * num
    end
    output
  end
end

