# take the input, iterate through each character adding to an array
# need an array that has n subarrays
# add letters to the subarrays, first n in order
# => next (n-1) in reverse
# => next (n-2) in order
# need a counter that goes 1..2..3..4..n..n-1..n-2..n-3..n-(n-1)..2..3..4..etc

require 'pry'
class RailFenceCipher
  def self.encode(string, n)
    return string if ( n == 1 || n > string.length )
    going_up = true
    output = []
    n.times do 
      output << Array.new
    end
    counter = 0
    array_of_chars = string.split('')
    array_of_chars.each do |letter|
      output[counter] << letter

      going_up = false if counter == n-1
      going_up = true if counter == 0
      going_up ? counter += 1 : counter -= 1
    end
    output.join
  end

  def self.decode(string, n)
    return string if ( n == 1 || n > string.length )
    if n == 2
      counter = 0
      decoded_str = ""
      loop do 
        break if string[counter + (string.length/2.0).ceil] == nil
        decoded_str << string[counter]
        decoded_str << string[counter + (string.length/2.0).ceil]
        counter += 1
        break if counter == (string.length/2)
      end
      decoded_str
    end
  end
end

p RailFenceCipher.decode('XXXXXXXXXOOOOOOOOO', 2)