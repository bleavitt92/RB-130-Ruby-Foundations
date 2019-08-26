# break characters into rows producing a rectangle 
# => ex: if 54 characters, 8 characters wide, 7 rows down
# => if perfect square use that
# => else choose num of columns by the next square up from amount
# =>  if between 5 and 8 should use 3 wide 

# read straight down the columns left to right for the coded message
require 'pry'
class Crypto
  attr_accessor :string, :size

  def initialize(string)
    @string = string
    delete_spaces_punctuation
    @size = num_columns
  end

  def char_count
    string.length
  end

  def num_columns
    Math.sqrt(char_count).ceil
  end

  def num_rows
    char_count / num_columns
  end

  def form_rectangle(string)
    array = []
    row = 1
    start = 0
    while row <= (num_rows) do
      array << [string[start, num_columns]]
      row += 1
      start += num_columns + 1
    end
    array
  end

  def crypt_text
    rectangle = form_rectangle(string).map { |word| word[0].split('') }
    output = []
    0.upto(num_columns-1) do |m|
      0.upto(num_rows-1) do |n|
        output << rectangle[n][m]
      end
    end
    output.join
  end

  def delete_spaces_punctuation
    string.gsub!(/\W/, '').downcase!
  end

  def normalize_plaintext
    self.string
  end
end

crypto = Crypto.new('s#$%^&plunk')
p crypto.normalize_plaintext