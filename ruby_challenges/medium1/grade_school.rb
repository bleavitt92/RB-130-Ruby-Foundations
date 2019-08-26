# methods needed
# => instance method to_h -- displays a hash of all grades as keys and all students in an array as values alphabetically
    # be sure it is sorted by grade, then name
# => instance method add('name', grade) -- adds name to grade
# => instance method grade(num) -- displays an array of all students in that grade
    # for grades with noone, display empty hash

class School
  attr_accessor :roster

  def initialize
    @roster = {
      1 => [],
      2 => [],
      3 => [],
      4 => [],
      5 => [],
      6 => [],
      7 => [],
      8 => [],
      9 => [],
    }
  end

  def to_h
    roster.delete_if { |grade, students| students.empty? }
    roster.map do |grade, students|
      students.sort!
    end
    roster
  end

  def add(name, grade)
    roster[grade] << name
  end

  def grade(number)
    roster[number].empty? ? [] : roster[number]
  end
end
