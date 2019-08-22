class House
  def self.recite
    phrases = new.get_pieces.reverse!
    puts "This is #{phrases[0][0]}\n\n"
    i = 1
    last = ""
    loop do 
      last = "#{phrases[i-1][0]}\n#{phrases[i-1][1]} #{last}"
      puts "This is #{phrases[i][0]}\n#{phrases[i][1]} #{last}"
      i += 1
      break if i == 12
      puts ''
    end
  end

  def get_pieces
    pieces
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

house = House.new

House.recite
