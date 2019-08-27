# input: word
# output: score

# edge cases for input: nil, invalid string with non letter characters, empty string, all 0
# be sure to downcase all input strings 

# organize point values into a hash where the keys are an array of letters and the values are the score values
# initialize the score to 0
# iterate through the input string
# each letter needs to search for itself in the point value hash and add the value to the score
# How to search? -- keys.select { |arr| arr.include?(letter) }
    # then do score += hash[above return value]

class Scrabble
  LETTER_VALUES = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10,
  }

  attr_reader :string
  attr_accessor :score

  def initialize(string)
    @string = string
  end

  def self.letter_score(letter)
    letters_array = LETTER_VALUES.keys.select { |arr| arr.include?(letter.downcase) }.flatten
    LETTER_VALUES[letters_array]
  end

  def score
    self.class.score(string)
  end

  def self.score(string)
    return 0 if self.invalid?(string)
    
    @score = 0
    string.each_char do |letter|
      @score += self.letter_score(letter)
    end
    @score
  end

  def self.invalid?(word)
    word == nil ||
    word == '' ||
    !word.downcase.match(/\A[a-z]*\Z/)
  end
end

p Scrabble.new('hello').score