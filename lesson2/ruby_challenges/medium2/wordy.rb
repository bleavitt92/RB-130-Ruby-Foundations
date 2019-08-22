require 'pry'
class WordProblem
  OPERATIONS = {
    :+ => 'plus',
    :- => 'minus',
    :* => 'multiplied',
    :/ => 'divided'
  }

  attr_reader :string

  def initialize(string)
    @string = string.split[2..-1]
    @string.delete('by')
  end

  def answer
    accumulator = string[0].to_i
    num1 = 0
    index = 0

    loop do 
      break if index >= string.size-1
      word = string[index]

      if word.to_i.to_s == word
        num1 = accumulator
      else
        operation = word
        num2 = string[index + 1].to_i
        accumulator = num1.send OPERATIONS.key(operation), num2
      end

      index += 1
      
    end
    accumulator
  end

  # def invalid?(string)
  #   string.each do |word|
  #     puts word
  #     return false if (OPERATIONS.has_value?(word) || word.to_i.to_s == word)
  #   end
  #   true
  # end
end

p WordProblem.new('3 plus 1').answer
