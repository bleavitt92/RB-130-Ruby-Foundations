require 'pry'
class Diamond

  def self.make_diamond(letter)
    @letter = letter
    alphabet = ('A'..'Z').to_a
    @index = alphabet.find_index(letter) 
    top_half
    bottom_half
  end

  def self.top_half
    ('A'..@letter).to_a.each do |char|
      self.form_row(char)
    end
  end

  def self.bottom_half
    ('A'..@letter).to_a.reverse.each do |char|
      next if char == @letter
      self.form_row(char)
    end
  end

  def self.form_row(l)
    if l == 'A'
      puts l.center(@index*2+1)
    else
      alphabet = ('A'..'Z').to_a
      idx = alphabet.find_index(l) 
      puts (l + " "*(idx*2-1) + l).center(@index*2+1)
    end
  end
end

p Diamond.make_diamond('A')
