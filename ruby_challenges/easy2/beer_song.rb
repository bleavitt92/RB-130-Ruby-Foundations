# have a verse method that takes a number as an input and outputs the verse with that many bottles
# lyrics:
# "n bottles of beer on the wall, n bottles of beer.\n" \ 
# "Take one down and pass it around, n-1 bottles of beer on the wall.\n"

class BeerSong
  attr_accessor :lyrics

  def initialize
    @lyrics = ''
    99.downto(2) do |n|
      @lyrics << "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" + "Take it down and pass it around, #{n-1} bottles of beer on the wall.\n" + "\n"
    end
    @lyrics << "1 bottle of beer on the wall, 1 bottle of beer.\n" + "Take it down and pass it around, no bottles of beer on the wall.\n" + "\n"
    @lyrics << "No more bottles of beer on the wall, no more bottles of beer.\n" + "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse(start_verse, end_verse = start_verse)
    output = ''
    if start_verse == 0
      output << "No more bottles of beer on the wall, no more bottles of bee.\n" + "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif start_verse == 1
      output << "1 bottle of beer on the wall, 1 bottle of beer.\n" + "Take it down and pass it around, no bottles of beer on the wall.\n" + "\n"
    else
      start_verse.downto(end_verse) do |n|
      output << "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" + "Take it down and pass it around, #{n-1} bottles of beer on the wall.\n"
      end
    end
    output
  end
end

puts BeerSong.new.verse(3)