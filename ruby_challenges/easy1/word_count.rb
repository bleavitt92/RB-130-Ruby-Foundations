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

    ignore_quotations(string)

    word_array = string.split(/[^a-zA-Z0-9']/).map do |word| 
      word.chars.delete_if { |letter| letter.match(/[^a-zA-Z0-9']/) }.join
    end

    word_array.delete_if { |string| string.empty? }

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

  def ignore_quotations(string)
    string.gsub!(/\W'/, " ") 
    string.gsub!(/'\W/, " ")
  end
end

phrase = Phrase.new("Go go 'GO' I'm")
p phrase.word_count
