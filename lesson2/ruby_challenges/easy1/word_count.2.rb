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

    format_words(string).each do |word|
      counts[word] += 1if counts.has_key?(word)
    end

    counts
  end

  private
  def reset_counts
    @counts = Hash.new(0)
  end

  def format_words(string)
    string.gsub(/\W'|'\W|[^a-zA-Z0-9']/, " ").split
    # subs any quotes around word or non letter or ' character for a space
    # /\b[\w']\b/ would have worked as the regex too
  end
end

phrase = Phrase.new("Hey")
p phrase.word_count
