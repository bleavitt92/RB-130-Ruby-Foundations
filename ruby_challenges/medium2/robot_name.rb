class Robot 
  attr_accessor :name
  @@robot_names = []

  def initialize
    reset
    @@robot_names.include?(name) ? reset : @@robot_names << name
  end

  def reset
     @name = ("A".."Z").to_a.sample(2).join + (0..9).to_a.sample(3).join
  end
end

