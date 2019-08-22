require 'pry'
class Cipher
  attr_accessor :key

  def initialize(*key)
    @key = key.join
    raise ArgumentError if (@key.match(/[A-Z0-9]/) || key == [''])
    @key = ('a'..'z').to_a.sample(100).join if @key.empty?
    @alphabet = ('a'..'z').to_a
  end

  def encode(text)
    idx = 0
    encoded_text = text.split('').map do |letter|
      current = @alphabet.find_index(letter)
      new = current + @alphabet.find_index(@key[idx])
      idx += 1
      new < 26 ? new : new -=26
      @alphabet[new]
    end
    encoded_text.join
  end

  def decode(text)
    idx = 0
    decoded_text = text.split('').map do |letter|
      current = @alphabet.find_index(letter)
      new = current - @alphabet.find_index(@key[idx])
      idx += 1
      new >= 0 ? new=new : new += 26
      @alphabet[new]
    end
    p decoded_text
    decoded_text.join
  end
end

