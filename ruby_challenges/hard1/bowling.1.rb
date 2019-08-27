require 'pry'

class Game
  @@num_rolls = 0
  @@current_frame = 0

  attr_accessor :total

  def initialize
    @total = 0
    set_up_frames
  end

  def set_up_frames
    @frames = []
    10.times do 
      @frames << Array.new(2)
    end
  end

  # def score
  #   total = 0
  #   frames.each_with_index do |frame, index|
  #     if frame[1] == nil 
  #       break
  #     elsif frame[0] == nil
  #       total += frame[1]
  #       break
  #     end

  #     if index == 9
  #       total += frame.sum
  #     elsif frame[0] == 10
  #       total += 10
  #       total += frames[index+1][0] + frames[index+1][1]
  #     elsif frame.sum == 10
  #       total += 10
  #       total += frames[index+1][0]
  #     else
  #       total += frame.sum
  #     end
  #   end
  #   total
  # end

  def score
    frames.each_with_index do |frame, index|
      if open?(frame) 
        total += frame.sum
      elsif spare?(frame) 
        total += spare_score(index)
      end
    end
    total
  end

  def open?(frame)
    (0..9).include?(frame.sum)
  end 
  
  def spare?(frame)
    frame.sum == 10 && frame[0] != 10
  end

  def spare_score(current_index)
    10 + @frames[current_index + 1][0]
  end

  def fill_balls_needed?
    !@frames[9].include?(nil) && @frames[9].sum == 10
  end
  
  def strike_frame
    
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

    if last_frame? && fill_balls_needed? && @frames[9][0] == 10
      self.total = 10
      @frames[9].delete(10)
    elsif last_frame? && fill_balls_needed? && @frames[9].sum == 10
      @frames[9] = [10, nil]
    end
  end

  def last_frame?
    @@current_frame == 9
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
roll_n_times(20, 5)
p @game.frames
p @game.score


