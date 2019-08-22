class Diamond
  def self.make_diamond(letter)
    line_length = ('A'..'Z').to_a.find_index(letter)*2 + 1
    num_spaces = line_length/2
    output = []
    ('A'..letter).each do |l|
      if l == 'A'
        output << " "*(num_spaces) + 'A' + " "*(num_spaces) + "\n"
      else
        output << " "*(num_spaces) + l + " "*(line_length-2-2*num_spaces) + l  + " "*(num_spaces) + "\n"
      end
      num_spaces -=1
    end
    
    num_spaces +=1
    ('A'..letter).reverse_each do |l|
      if l == letter
        num_spaces += 1
        next
      elsif l == 'A'
        output << " "*(num_spaces) + 'A' + " "*(num_spaces) + "\n"
      else
        output << " "*(num_spaces) + l + " "*(line_length-2-2*num_spaces) + l  + " "*(num_spaces) + "\n"
      end
      num_spaces+=1
    end
    output.join
  end
end

puts Diamond.make_diamond('C')




# require 'pry'
# class Diamond
#   def self.make_diamond(letter)
#     output = ''
#     current_num = 65
#     spaces = 1
#     loop do
#       char = current_num.chr
#       if char == 'A'
#         output << "A\n"
#       else
#         output << char + " "*(spaces) + char + "\n"
#         spaces += 2
#       end
#       break if current_num == letter.ord
#       current_num += 1
#     end
#     output
    
#   end
# end

