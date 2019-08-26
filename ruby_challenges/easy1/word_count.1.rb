# input: string
# output: hash
# add each word in the string to a hash. If it is already included, add one to the value

class Phrase
  attr_reader :string, :counts

  def initialize(string)
    @string = string.downcase
    @counts = Hash.new
  end

  def word_count
    reset_counts
    word_array = find_words(string).split

    word_array.each do |word|
      if counts.has_key?(word)
        counts[word] += 1
      else
        counts[word] = 1
      end
    end
    counts
  end

  def reset_counts
    @counts = Hash.new
  end

  def find_words(string)
    string = string.gsub(/\W'/, " ") 
    string = string.gsub(/'\W/, " ")
    string = string.gsub(/[^a-zA-Z0-9']/, " ")
    string
  end
end

phrase = Phrase.new("Hey")
p phrase.word_count
