# reverse pieces array
# always starts with 'This is' and then add phrase from the pieces[current] array
# next line is pieces[current][1] + pieces[current-1][0]
# ending stays same once set. 

class House
  def self.recite
    phrases = new.get_pieces
    output = ''
    ending = "#{phrases[0][0]}.\n"
    output << "This is #{ending}"
    ending.prepend("#{phrases[1][1]} ")
    output << "\nThis is #{phrases[1][0]} \n#{ending}"

    m = 2
    loop do 
      ending.prepend("#{phrases[m][1]} #{phrases[m-1][0]}\n")
      m += 1
      output << "\nThis is #{phrases[m-1][0]}\n#{ending}"
      break if m == phrases.size
     end
     output
  end

  def get_pieces
    pieces.reverse!
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
