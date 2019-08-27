require 'pry'
class Crypto
  attr_accessor

  def initialize(string)
    @normalized_plaintext = string.gsub(/\W/, '').downcase
  end

  def normalize_plaintext
    @normalized_plaintext
  end

  def size
    plain_text_size = @normalized_plaintext.length
    Math.sqrt(plain_text_size).ceil
  end

  def plaintext_segments
    output =[]
    start = 0
    loop do 
      #binding.pry
      output << @normalized_plaintext.split('')[start, self.size].join
      start += self.size
      break if start >= @normalized_plaintext.length
    end
    output
  end

  def ciphertext
    segments = self.plaintext_segments
    output = ''
    0.upto(self.size-1) do |m|
      segments.each do |seg|
        break if seg[m] == nil
        output << seg[m]
      end 
    end
    output
  end

  # def normalize_ciphertext
  #   ciphered_text = self.ciphertext
  #   index_for_space = self.size-1
  #   loop do 
  #     ciphered_text.insert(index_for_space, ' ')
  #     index_for_space += self.size
  #     break if index_for_space >= @normalized_plaintext.length
  #   end
  #   ciphered_text
  # end

  def normalize_ciphertext
    ciphered_text = self.ciphertext
    output = []
    start = 0
    loop do 
      output << ciphered_text[start, self.size-1]
      start += self.size-1
      break if start >= @normalized_plaintext.length
    end
    output.join(' ')
  end
end

crypto = Crypto.new('Madness, and then illumination.')
p crypto.normalize_plaintext
p crypto.size
p crypto.plaintext_segments
p crypto.ciphertext
p crypto.normalize_ciphertext
