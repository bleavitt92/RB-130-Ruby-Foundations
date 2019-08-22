# initialize with a string for the matrix in Matrix class
# rows instance method that returns the string matrix as an array
# columns[n] instance method that returns the nth value in each row in an array
# saddle_points instance method - returns an array (can be empty) of saddle points position
require 'pry'
class Matrix 
  attr_accessor :matrix

  def initialize(matrix_string)
    @matrix = matrix_string
  end

  def rows
    matrix.split("\n").map { |str| str.split(" ") }.map do |arr|
      arr.map(&:to_i)
    end
  end

  def columns
    row_array = self.rows
    col_array = []
    index = 0
    loop do 
      indiv_columns = []
      row_array.each do |array|
        indiv_columns << array[index]
      end
      col_array << indiv_columns
      index += 1
      break if index >= row_array[0].size
    end
    col_array
  end

  def saddle_points
    saddle_points = []
    self.rows.each_with_index do |row, row_num|
      col_num = row.find_index(row.max)
      if self.columns[col_num].min == row.max
        saddle_points << [row_num, col_num]
      end 
    end
    saddle_points
  end
end

