# method to add students. add(name, grade)
  # adds student to the hash for that grade. key is grade, names in array
# to_h method that displays the hash


class School
  attr_reader :roster

  def initialize
    @roster = { 
      1 => [],
      2 => [],
      3 => [],
      4 => [],
      5 => [],
      6 => [],
      7 => []
    }
  end

  def to_h
    roster.select { |k, v| !v.empty? }
  end

  def add(name, grade)
    roster[grade] << name
    roster[grade].sort!
  end

  def grade(num)
    roster[num]
  end
end
