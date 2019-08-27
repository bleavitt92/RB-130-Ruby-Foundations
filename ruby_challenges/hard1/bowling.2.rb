require 'pry'

class Game
  @@current_frame = 0
  attr_accessor :frames

  def initialize
    @score = []
    set_up_frames
  end

  def set_up_frames
    @frames = []
    10.times { @frames << Array.new }
  end

  def score
    total = 0
    frames.each { |frame| total += frame.sum }
    first_9 = frames[0..8]
    first_9.flatten.each_with_index do |num, i|
      if num == 10
        total += frames.flatten[i+1]
        total += frames.flatten[i+2]
      end
    end
    first_9.each_with_index do |frame, i|
      if frame.size == 2 && frame.sum == 10
        total += frames[i+1][0]
      end
    end
    total
  end

  def roll(pins)
    case pins
    when (0..9)
      @frames[@@current_frame] << pins
      if @@current_frame == 9 && @frames[9].sum == 10 && @frames[9].size == 2
        @@current_frame += 0
      elsif @@current_frame == 9 && @frames[9].size == 2 && @frames[9][0] == 10
        @@current_frame += 0
      elsif @frames[@@current_frame].size == 2
        @@current_frame += 1 
      end
    when 10
      @frames[@@current_frame] << pins
      if @@current_frame == 9
        @@current_frame += 0
      else 
        @@current_frame += 1
      end
    end
  end
end

