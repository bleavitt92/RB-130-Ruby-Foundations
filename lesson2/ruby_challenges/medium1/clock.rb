class Clock
  attr_accessor :hour, :min

  def self.at(hour, min=0)
    new(hour, min)
  end
  
  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def to_s
    "#{format('%02d', hour)}:#{format('%02d', min)}"
  end

  def +(num)
    hour_add, min_add = (num).divmod(60)
    new_hour = hour + hour_add
    new_hour >= 24 ? new_hour = new_hour - 24 : new_hour
    new_min = min+ min_add
    self.class.at(new_hour, new_min)
  end

  def -(num)
    loop do 
      break if num < 60
      self.hour -= 1
      num -= 60
    end

    if num > min
      self.hour -=1
      self.min = 60 - (num-min)
    else
      self.min = min - num
    end
    
    self.hour += 24 if self.hour < 0
    self.class.at(hour, min)
  end

  def ==(other)
    self.hour == other.hour && self.min == other.min
  end
end

p Clock.at(0, 40) - 60
