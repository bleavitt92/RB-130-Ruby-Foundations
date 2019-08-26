# input: word
# output: array of words
# match words with exact same letters.
# sorted_input = input to array of chars then sort it and join it
# match input is the array of words to check against
# iterate through that array, taking each word, changing it to an array of chars and sort it and join it
# use regex to match input word to array word
require 'pry'
class Anagram
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def match(array)
    match_word = input.downcase.chars.sort.join # sort the match word by letters
    matches = []
    array.delete_if { |word| word.downcase == input.downcase } # delete words from array that are same as input

    match_array = array.map { |word| word.downcase.chars.sort.join } # array of words sorted by letters

    match_array.each_with_index do |word, idx|
      matches << array[idx] if word == match_word
    end
    matches
  end
end
