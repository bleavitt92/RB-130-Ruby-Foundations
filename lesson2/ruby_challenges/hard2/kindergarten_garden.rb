class Garden
  PLANTS = { 'R' => :radishes, 'C' => :clover, 'G' => :grass, 'V' => :violets }
  attr_reader :garden, :student_gardens, :students

  def initialize(garden_string, students = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry))
    @garden = garden_string.split
    @student_gardens = Hash.new
    @students = students.map!{|student| student.downcase}.sort.each { |student| @student_gardens[student] = [] }
    set_up_gardens
    set_up_methods
  end

  def set_up_gardens
    num = 0
    students.each do |student|
      (0..1).each do |row|
        student_gardens[student] << [garden[row][num], garden[row][num+1]] 
      end
      num += 2
    end
    student_gardens
  end

  def set_up_methods
    students.each do |student|
      define_singleton_method(:"#{student}") do 
        student_gardens[student].join(' ').split(' ').map!{ |letter| PLANTS[letter] }
      end
    end
  end
end

