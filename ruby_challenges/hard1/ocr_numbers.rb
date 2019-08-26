require 'pry'
class OCR 
  NUMBERS = {
    "0" => " _\n| |\n|_|\n",
    "1" => "\n  |\n  |\n",
    "2" => " _\n _|\n|_\n",
    "3" => " _\n _|\n _|\n",
    "4" => "\n|_|\n  |\n", 
    "5" => " _\n|_\n _|\n", 
    "6" => " _\n|_\n|_|\n",
    "7" => " _\n  |\n  |\n",
    "8" => " _\n|_|\n|_|\n",
    "9" => " _\n|_|\n _|\n"
  }

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def convert
    if NUMBERS.key(text) 
      NUMBERS.key(text) 
    elsif text.include?("\n\n")
      split_rows
    else
      split_nums(text)
    end
  end

  def split_rows
    rows = text.split("\n\n")
    rows.map { |row| split_nums(row) }
  end

  def split_nums(text)
    lines = text.split("\n")
    start = 0
    output = ''
    
    loop do 
      separated_nums = []

      lines.map do |line|
        line.prepend(' ') if line.length % 3 != 0
        break if line[start, 3].nil?
        separated_nums << line[start, 3]
        separated_nums
      end

      if separated_nums[0].match(/^\s{2}_/)
        separated_nums[0].gsub!(/^\s{2}_/, " _") 
      else
        separated_nums[0].gsub!(/^\s+/, "")
      end
      separated_nums[-1].gsub!(/\s+$/, "") if separated_nums[-1].match(/\s+$/)
      separated_nums[1].gsub!(/\s+$/, "") if separated_nums[1].match(/\s+$/)

      string = separated_nums.join("\n") + "\n"
      p string
      if NUMBERS.key(string) 
        output << OCR.new(string).convert
      else
        output << '?'
      end
      start += 3
      break if start >= lines[-1].size
    end
    output
  end
end

p OCR.new("\n |_\n  |\n").convert

    text = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

NUMBER
    
#p OCR.new(text).convert
