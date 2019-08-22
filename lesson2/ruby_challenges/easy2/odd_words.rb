# input: string of one or more words with period at the end
# ouput: string where odd indexed words are reversed
# use string.split to split up each word into an array of words.
# iterate through the array adding each even indexed word to the output
# when have an odd indexed word, reverse it before adding it to the output

def odd_words(string)
  output = []
  return "Invalid string" if !validate_input(string)

  string.delete('.').split.each_with_index do |word, index|
    index.even? ? output << word  : output << word.reverse 
  end
  output.join(' ') + '.'
end

  def validate_input(string)
    string.match(/\A[\s*A-Za-z*]*.\Z/) &&
    string.chars.delete_if { |char| char == ' ' }.size <= 20
  end

def print_slow(array)
  array.each do |word|
    if word == array[-1]
      print word + '.'
      sleep(0.5)
    else
      print word + ' '
      sleep(0.5)
    end
  end
end

p odd_words('.') == '.'

p odd_words('hello word.') == 'hello drow.'
p odd_words('hey hello word.')
