# take a string input of all capital letters
# create a method called hamming_distance that takes a string as an argument
# use the sorter distance of the two
# 
# iterate over the shorter string comparing each letter with the other string
# if they are the same, do nothing
# if they are different add 1 to the hamming distance
require 'pry'
class DNA
  attr_reader :dna

  def initialize(dna_string)
    @dna = dna_string
  end

  def hamming_distance(string)
    hammingdistance = 0
    string.chars.each_with_index do |letter, idx|
      break if dna[idx] == nil
      hammingdistance += 1 if letter != dna[idx]
    end
    hammingdistance
  end
end
