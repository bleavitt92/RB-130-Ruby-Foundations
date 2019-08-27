require 'pry'
class RunLengthEncoding
  def self.encode(input)
    letter_counter = Hash.new(1)
    output = ''
    input.chars.each_with_index.map do |letter, index|
      if letter == input[index + 1]
        letter_counter[letter] += 1
      else
        if letter_counter[letter] == 1
          output << letter
        else
          output <<  "#{letter_counter[letter]}#{letter}"
        end
        letter_counter = Hash.new(1)
      end
    end
    output
  end

  def self.decode(input)
    letters = input.split(/\d/)
    letters.delete("")
    numbers = input.split(/\D/)
    numbers.delete("")

    output = ''
    i = 0
    letters.each do |letter|
      if letter.size == 1
        output << letter*numbers[i].to_i
      elsif letter.size == 2
        first, second = letter.split('')
        output << first*numbers[i].to_i
        output << second
      end
      i += 1
    end
    output
  end
end

p RunLengthEncoding.encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB')

