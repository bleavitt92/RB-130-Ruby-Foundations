class Crypto 
  attr_accessor :string

  def initialize(string)
    @string = string
    normalize_plaintext
  end

  def normalize_plaintext
    self.string = string.gsub(/' '/, '').gsub(/\W/, '').downcase
  end

  def size
    Math.sqrt(string.size).ceil
  end

  def plaintext_segments
    string.scan(/.{1,#{self.size}}/)
  end

  def ciphertext
    output = ''
    n = 0
    loop do
      m = 0
      loop do
        output << plaintext_segments[m][n] unless plaintext_segments[m][n] == nil
        m += 1
        break if m == plaintext_segments.size
      end
      n += 1
      break if n == plaintext_segments[0].size
    end
    output
  end

  def normalize_ciphertext
    output = ''
    n = 0
    loop do
      m = 0
      loop do
        output << plaintext_segments[m][n] unless plaintext_segments[m][n] == nil
        m += 1
        if m == plaintext_segments.size
          output << ' '
          break
        end
      end
      n += 1
      break if n == plaintext_segments[0].size
    end
    output.rstrip
  end
end
