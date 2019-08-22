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
    row_array = matrix.split("\n").map { |str| str.split(" ") }.map do |arr|
      arr.map(&:to_i)
    end
    col_array = []
    index = 0
    loop do 
      counter = 0
      indiv_columns = []
      loop do
        indiv_columns << row_array[counter][index]
        counter +=1
        break if counter >= row_array.size
      end
      col_array << indiv_columns
      index += 1
      break if index >= row_array[0].size
    end
    col_array
  end

  def saddle_points
    saddle_points = []
    max_values = []
    min_values = []
    self.rows.each { |arr| max_values << arr.max }
    self.columns.each { |arr| min_values << arr.min }
    value = (max_values & min_values).join.to_i
    self.rows.each_with_index do |arr, index|
      saddle_points << [index, arr.find_index(value)] if arr.find_index(value)
    end
    saddle_points
  end
end

matrix = Matrix.new("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7")
p matrix.rows
p matrix.columns
p matrix.saddle_points
