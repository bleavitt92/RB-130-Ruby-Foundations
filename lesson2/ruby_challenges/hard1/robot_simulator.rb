# turn_right, turn_left instance methods

class Robot
  DIRECTIONS = [:north, :east, :south, :west]

  attr_accessor :bearing, :coordinates
  
  def initialize
    @bearing = :nil
    @coordinates = nil
  end

  def orient(direction)
    if DIRECTIONS.include?(direction)
      self.bearing = direction
    else
      raise ArgumentError, 'invalid direction'
    end
  end

  def turn_right
    case bearing
    when :north then self.bearing = :east
    when :east then self.bearing = :south
    when :south then self.bearing = :west
    when :west then self.bearing = :north
    end
  end 

  def turn_left
    case bearing
    when :north then self.bearing = :west
    when :west then self.bearing = :south
    when :south then self.bearing = :east
    when :east then self.bearing = :north
    end
  end

  def at(x, y)
    self.coordinates = [x, y]
  end

  def advance
    case self.bearing
    when :north then self.coordinates[1] += 1
    when :south then self.coordinates[1] -= 1
    when :east then self.coordinates[0] += 1
    when :west then self.coordinates[0] -= 1
    end
  end
end

class Simulator 
  def instructions(string)
    steps = string.split('')
    steps.map! do |step|
      case step
      when 'L' then :turn_left
      when 'R' then :turn_right
      when 'A' then :advance
      end 
    end 
  end

  def place(robot, x: nil, y: nil, direction: nil)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, string)
    commands = instructions(string)
    commands.each do |command|
      robot.send(command)
    end
  end
end
