class Garden
  PLANTS = { 'R' => :radishes, 'C' => :clover, 'G' => :grass, 'V' => :violets }
  OG_STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
  attr_reader :gardens, :students

  def initialize(garden_string, students = OG_STUDENTS)
    @row_1, @row_2 = garden_string.split
    @gardens = Hash.new
    @students = students.map!{ |student| student.downcase }.sort
    set_up_gardens
    set_up_methods
  end

  def set_up_gardens
    num = 0
    students.each do |student|
      gardens[student] = []
      gardens[student] << [@row_1[num], @row_1[num+1]] + [@row_2[num], @row_2[num+1]]
      num += 2
    end
  end

  def set_up_methods
    students.each do |student|
      define_singleton_method(:"#{student}") do 
        gardens[student].join(' ').split(' ').map!{ |letter| PLANTS[letter] }
      end
    end
  end
end

