# input: string
# output: integer for the score
# split the input string into an array of characters.
# iterate through the array of characters for each character iterate through the hash
# # if hashkey includes the array, add the value to the score total

class Scrabble
  SCORES = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10,
  }

  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def self.score(string)
    return 0 if string.nil? || string.match(/\W/)

    score = 0
    string.downcase.chars.each do |letter|
      SCORES.each do |array, value|
        if array.include?(letter)
          score += value
        end
      end
    end
    score
  end

  def score
    self.class.score(string)
  end
end

p Scrabble.score('alacrity')
