class Anagram
  attr_reader :input_word, :letters

  def initialize(input_word)
    @input_word = input_word
    @letters = sort_letters(@input_word)
  end

  def match(array)
    array.select { |word| sort_letters(word) == letters && word.downcase != input_word.downcase }
  end

  def sort_letters(word)
    word.downcase.chars.sort.join
  end
end
