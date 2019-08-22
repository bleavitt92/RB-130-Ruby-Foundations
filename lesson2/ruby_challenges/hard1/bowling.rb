require 'pry'
class Game
  @@num_rolls = 0
  @@current_frame = 0

  def initialize
    @score = []
    set_up_frames
  end

  def set_up_frames
    @frames = []
    10.times do 
      @frames << Array.new(2)
    end
  end

  def score
    total = 0
    frames.each_with_index do |frame, index|
      if frame[1] == nil 
        break
      elsif frame[0] == nil
        total += frame[1]
        break
      end

      if frame[0] == 10
        total += 10
        total += frames[index+1][0] + frames[index+1][1]
      elsif frame.sum == 10
        total += 10
        total += frames[index+1][0]
      else
        total += frame.sum
      end
    end
    total
  end

  def roll(pins)
    case pins
    when (0..9)
      @frames[@@current_frame].prepend(pins).pop
      @@num_rolls += 1
      @@current_frame += 1 if @@num_rolls.even?
    when 10
      @frames[@@current_frame].prepend(pins).pop
      @@num_rolls += 1
      @@current_frame += 1 if @@num_rolls.even?
      self.roll(0) if @@num_rolls.odd?
    end
  end

  def frames
    @frames.map { |frame| frame.reverse }
  end
end

@game = Game.new
def roll_n_times(rolls, pins)
  rolls.times do
    Array(pins).each { |value| @game.roll(value) }
  end
end
p roll_n_times(20, 0)
p @game.frames
 @game.score
